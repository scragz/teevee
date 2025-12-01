# Modularization Strategy: Teevee v5 (Synthesized)

This document defines the architecture for splitting the monolithic Teevee patch into manageable, hot-swappable modules. It combines the granularity of logical signal flow with strict file management for external code.

## 1. Directory Structure

We separate the "Container" (Max patches) from the "Logic" (Gen/GLSL code).

```text
Teevee_Project/
├── teevee-v5.amxd          (The Shell: Host device, parameters, and routing)
├── modules/                (The Abstractions: .maxpat files)
│   ├── tv.sync.maxpat      (The Clock: Master phasor & index generation)
│   ├── tv.ingest.maxpat    (The Writer: Audio → MS-Flux → Matrix)
│   ├── tv.egress.maxpat    (The Reader: Matrix → MS-Flux → Audio)
│   ├── tv.fx.maxpat        (The Engine: GPU processing chain)
│   ├── tv.viz.maxpat       (The Monitor: UI visualization)
│   └── tv.param.maxpat     (The Hub: Parameter scaling & distribution)
└── code/                   (The Logic: .gendsp / .genjit files)
    ├── tv.encode.gendsp    (Audio Gen: L/R → A/R/G/B)
    ├── tv.decode.gendsp    (Audio Gen: A/R/G/B → L/R)
    └── tv.core.genjit      (Video Gen: Scroll, Warp, Smear, Edge)
```

-----

## 2. The Abstractions (Modules)

### A. `tv.sync.maxpat` (The Heartbeat)

**Purpose:** Centralized timing authority to prevent read/write drift.

  * **Inlets:** None (or Transport info).
  * **Outlets:**
      * 1: `signal` (Master Phasor 0-1).
      * 2: `signal` (Write Index 0 to Dim-1).
      * 3: `signal` (Normalized Read Ramp 0-1 for texture sampling).
  * **Logic:**
      * Calculates `samplerate / vectorsize`.
      * Generates the master `phasor~`.
      * **Crucial:** This ensures the Write head (`ingest`) and Read head (`egress`) are mathematically locked.

### B. `tv.ingest.maxpat` (The Writer)

**Purpose:** Combines DSP encoding and Matrix writing.

  * **Inlets:**
      * 1: `signal` (Audio Left).
      * 2: `signal` (Audio Right).
      * 3: `signal` (Write Index from `tv.sync`).
  * **Outlets:** None (Writes to named matrix `---tv_ram`).
  * **Internal Logic:**
      * **DSP:** `gen~ @file tv.encode.gendsp`
          * Calculates Alpha (RMS), Red (Mid), Green (Flux), Blue (Side).
      * **IO:** `jit.poke~` (x4)
          * Writes the 4 planes to `jit.matrix ---tv_ram 4 float32 256 256`.

### C. `tv.fx.maxpat` (The GPU Engine)

**Purpose:** The visual DSP chain. Hosting the GL context and the Pix shader.

  * **Inlets:**
      * 1: `jit_matrix` (Bang/Trigger to render).
  * **Outlets:**
      * 1: `jit_gl_texture` (Output for Viz).
  * **Internal Logic:**
      * **Context:** `jit.gl.node @name ---tv_node @capture 1`.
      * **Input:** `jit.gl.texture @name ---tv_tex` (Linked to `---tv_ram`).
      * **Process:** `jit.gl.pix @file tv.core.genjit`.
          * Handles Scroll, Warp, Smear, Edge, Reaction all in one pass.
      * **Feedback:** Output of pix writes back to `---tv_tex`.

### D. `tv.egress.maxpat` (The Reader)

**Purpose:** Reads the processed texture/matrix and decodes to stereo.

  * **Inlets:**
      * 1: `signal` (Read Index from `tv.sync`).
      * 2: `signal` (Y-Axis Scrubber Position 0-1).
  * **Outlets:**
      * 1: `signal` (Audio Left).
      * 2: `signal` (Audio Right).
  * **Internal Logic:**
      * **IO:** `jit.peek~` (x4) reads from `---tv_ram`.
          * *Note:* The GPU texture `---tv_tex` must be read back to the CPU matrix `---tv_ram` inside `tv.fx` for this to work, OR `jit.peek~` reads a CPU mirror.
      * **DSP:** `gen~ @file tv.decode.gendsp`
          * Reconstructs Stereo from A/R/G/B.

### E. `tv.param.maxpat` (The Hub)

**Purpose:** Decouples UI form from DSP function.

  * **Logic:**
      * Receives raw 0-1 values from `live.dial` / `live.numbox` in the main device.
      * Scales them (e.g., Zoom 0.25x - 4.0x).
      * Sends to `receive` objects inside `tv.fx` or `tv.ingest`.
      * *Naming:* `s ---tv_param_zoom`, `s ---tv_param_scroll`.

-----

## 3. The External Code (Logic)

Using external files prevents JSON corruption and allows using external editors (VS Code, Sublime).

### `tv.encode.gendsp`

  * **Inputs:** Left, Right.
  * **Logic:**
      * `Mid = (L+R) * 0.5`
      * `Side = (L-R) * 0.5`
      * `Alpha = slide(abs(Mid), 10, 100)` (Simple Envelope)
      * `Green = abs(Mid - history(Mid))` (Simple Spectral Flux)

### `tv.decode.gendsp`

  * **Inputs:** Alpha, Red(Mid), Green, Blue(Side).
  * **Logic:**
      * `L = Red + Blue`
      * `R = Red - Blue`
      * `Gate = Alpha > thresh ? 1 : 0` (Optional Gating)

### `tv.core.genjit`

  * **Inputs:** `in1` (Feedback Texture).
  * **Params:** `scroll_speed`, `zoom`, `rotation`, `smear`.
  * **Logic:**
      * **Scroll:** Sample `in1` at `vec2(uv.x, uv.y - scroll_speed)`.
      * **Warp:** Apply rotation/zoom matrix to UVs before sampling.
      * **Smear:** Mix current pixel with previous frame pixel.

-----

## 4. Implementation Checklist

1.  **Step 1 (The Skeleton):** Create the file structure and blank files.
2.  **Step 2 (The Signal Path):** Build `tv.sync`, `tv.ingest`, `tv.egress` first. Verify audio passes through cleanly without GPU processing.
3.  **Step 3 (The Visuals):** Build `tv.fx` and `tv.core.genjit`. Connect the feedback loop.
4.  **Step 4 (The Glue):** Build `tv.param` and wire up the main `teevee-v5.amxd` UI knobs.

## 5. Critical M4L Rules

  * **Naming:** Always use `---` prefix for named matrices/textures (e.g., `---tv_ram`) to ensure they are local to the device instance.
  * **Types:** Always use `float32` for matrices and textures.
  * **Dims:** X-dimension must match Vector Size (typically 256 or 512).
