This document consolidates the original system architecture with the new "Signal Artifacts" expansion. It redefines the Synesthetic Map and the precise signal flow to ensure the Audio and Video engines remain mechanically isomorphic.

# System Architecture 2.0: Teevee

## I. Core Concept

Teevee uses a **Parallel Twin Engine** architecture. Two simultaneous processing chains are driven by a unified control system.

  * **The Audio Engine (MSP):** High-fidelity, 64-bit, artifact-free DSP.
  * **The Video Engine (Jitter):** A reactive "Heads-Up Display" that visualizes the audio manipulations using metaphorical shaders.

**The Goal:** "What you see is what you hear." A 1:1 mapping of video aesthetics to audio physics.

-----

## II. The Expanded Synesthetic Map

This map defines how visual transformations translate to audio DSP. It is divided into **Core Transforms** (Geometry), **Artifacts** (Resolution/Color), and **Temporal States**.

### A. Core Transforms (Geometry)

*Manipulating the position and orientation of the medium.*

| Parameter | Visual Metaphor (GPU) | Audio Mechanism (MSP) | The Shared Experience |
| :--- | :--- | :--- | :--- |
| **SCROLL** | **Vertical Pan** (Y-Axis Offset) | **Delay Line** (Time Offset) | Pushing the content away into the "past." |
| **ZOOM** | **UV Scaling** (Stretch/Squash) | **Varispeed** (Repitch) | Stretching the medium. Zoom In = Slow Down. |
| **ROTATE** | **2D Rotation** (Twist) | **Frequency Shift** (Spectrum Shift) | Displacing content from its center/fundamental. |

### B. Signal Artifacts (Texture)

*Degrading the quality and integrity of the signal.*

| Parameter | Visual Metaphor (GPU) | Audio Mechanism (MSP) | The Shared Experience |
| :--- | :--- | :--- | :--- |
| **MOSAIC** | **Pixelation** (Spatial Res) | **Downsampling** (Time Quantization) | The grid becomes visible. "Robotic" ringing. |
| **ABERRATION**| **RGB Shift** (Channel Offset) | **Multiband Delay** (Spectral Split) | The constituent parts (colors/freqs) separate. |
| **BLOOM** | **Glow/Bleed** (Saturation) | **Overdrive** (Harmonic Distortion) | Energy overflows its container. Edges blur. |
| **SOLARIZE** | **Luma Inversion** (Threshold) | **Wavefolding** (Foldover) | Peaks are too high and wrap around. Metallic. |
| **CRUSH** | **Posterization** (Color Depth) | **Bit Reduction** (Amp Quantization) | The gradient steps become visible. Low-Fi. |

### C. Time & Space (Motion)

*Manipulating the persistence and flow of the signal.*

| Parameter | Visual Metaphor (GPU) | Audio Mechanism (MSP) | The Shared Experience |
| :--- | :--- | :--- | :--- |
| **SHUTTER** | **Strobe** (Frame Gating) | **Tremolo** (Amplitude Gating) | A rhythmic mechanical chopping of the stream. |
| **GHOSTING** | **Double Vision** (Lag) | **Slapback** (Short Delay) | A distinct "shadow" of the signal following it. |
| **SMEAR** | **Frame Feedback** (Blur) | **Reverb** (Decay) | The refusal of the signal to die. Infinite tails. |

-----

## III. System Topology & Signal Flow

To maintain the metaphor, the Audio and Video engines must follow the exact same logical order of operations.

**The Golden Chain:**
`Input` $\to$ `Geometry` $\to$ `Resolution` $\to$ `Distortion` $\to$ `Gating` $\to$ `Space` $\to$ `Output`

### Path A: The Audio Engine (MSP)

*File: `tv.audio.maxpat` & `tv.fx.maxpat`*

1.  **Input Buffer** (Circular Recording)
2.  **Geometry (The Read Head)**
      * **Scroll:** Delay offset (0–1000ms).
      * **Zoom:** Varispeed playback (0.5x–2.0x).
      * **Rotate:** Frequency Shifter (-500Hz to +500Hz).
3.  **Resolution**
      * **Mosaic:** `degrade~` (Sample Rate reduction).
4.  **Split**
      * **Aberration:** Multiband crossover $\to$ micro-delays on High/Mid bands.
5.  **Distortion**
      * **Bloom:** `overdrive~` / `tanh~` (Saturation).
      * **Solarize:** `pong~` (Wavefolding/Inversion).
      * **Crush:** `degrade~` (Bit Depth reduction).
6.  **Gating**
      * **Shutter:** `phasor~` driven Tremolo (Square wave LFO).
7.  **Space**
      * **Ghosting:** Short `tapout~` (15-30ms) with high feedback (Metallic).
      * **Smear:** Feedback Delay Network / Reverb (Wash).
8.  **Output**

### Path B: The Video Engine (Jitter)

*File: `tv.viz.maxpat` (incorporating `tv.core.genjit`)*

1.  **Ingest** (Audio Features mapped to Matrix)
2.  **Geometry (Coordinates)**
      * **Scroll:** Offset Y.
      * **Zoom:** Scale UV.
      * **Rotate:** Rotate UV.
3.  **Resolution**
      * **Mosaic:** Quantize UV coordinates (Pixelate).
4.  **Split**
      * **Aberration:** Sample texture 3x with offsets for R, G, B.
5.  **Distortion**
      * **Bloom:** 4-Tap Blur + Threshold + Additive Blend.
      * **Solarize:** `abs(rgb - threshold)`.
      * **Crush:** Quantize RGB values (Posterize).
6.  **Gating**
      * **Shutter:** Multiplies output by Black based on Time LFO.
7.  **Space**
      * **Ghosting:** Mix with frame buffer from 2 frames ago.
      * **Smear:** Mix with immediate previous frame (Feedback).
8.  **Output**

-----

## IV. Module Architecture

The project structure is updated to house the new effects processing in dedicated sub-patches.

```text
Teevee_Project/
├── teevee.amxd             (The Shell)
├── modules/
│   ├── tv.main.maxpat      (Router)
│   ├── tv.audio.maxpat     (Path A: Core Geometry - Delay/Pitch/Shift)
│   ├── tv.fx.maxpat        (Path A: Artifacts - Crush/Bloom/Mosaic/etc)
│   ├── tv.ingest.maxpat    (Path B: Feature Extraction)
│   ├── tv.viz.maxpat       (Path B: Display System)
│   ├── tv.sync.maxpat      (Master Clock/LFOs)
│   └── tv.param.maxpat     (Parameter Handling)
└── code/
    ├── tv.core.genjit      (Video Gen: Geometry & Artifacts Shader)
    └── tv.encode.gendsp    (Audio Feature Extraction)
```

### Module Responsibilities

| Module | Responsibility | New Additions |
| :--- | :--- | :--- |
| **tv.audio** | **Geometry.** Handles the "Tape Head" logic. Buffer playback, pitch, and frequency shifting. | *Unchanged* |
| **tv.fx** | **Artifacts.** A serial chain of MSP objects handling the degradation and color effects. | Houses Mosaic, Aberration, Bloom, Solarize, Crush, Shutter, Ghosting. |
| **tv.viz** | **Visuals.** Manages the Jitter matrix and the Gen shader. | Now accepts 7 new parameters to pass to the shader. |
| **tv.core.genjit** | **The Shader.** The massive GLSL kernel processing the video. | Updated with all 7 new effect algorithms. |

-----

## V. Interaction Logic (Meta-States)

These operate outside the standard signal chain, affecting the *state* of the system.

### 1. FREEZE (The Datamosh)

  * **Audio:** Input Gate closes (`gate~ 0`). Buffer stops updating. Read head continues to loop the trapped snippet.
  * **Video:** `jit.poke~` stops writing. The matrix stops updating. The visualizer renders the "stuck" frame, allowing the effects (Zoom/Rotate) to manipulate the static image.

### 2. SCRUB (The Tape Slip)

  * **Audio:** Random noise added to the `index~` read pointer. Causes pitch warble and timing jitter.
  * **Video:** Random noise added to the X-Axis offset. Causes "tracking error" horizontal shaking.

-----

## VI. Parameter Scaling Reference

All parameters are normalized (0.0 - 1.0) coming from the UI.

| Parameter | Audio Scale | Audio Object | Video Scale | Video Logic |
| :--- | :--- | :--- | :--- | :--- |
| **Mosaic** | 1.0 $\to$ 0.05 SR | `degrade~` | 2048.0 $\to$ 10.0 cells | `floor(uv*cells)` |
| **Aberration**| 0ms $\to$ 40ms | `tapout~` | 0.0 $\to$ 0.05 offset | `uv + vec2(shift,0)` |
| **Bloom** | 1.0 $\to$ 8.0 Drive | `overdrive~` | 0.0 $\to$ 1.0 Intensity | Blur + Add |
| **Solarize** | 0.0 $\to$ 1.0 Thresh | `pong~` | 0.0 $\to$ 1.0 Thresh | `abs(col - sol)` |
| **Crush** | 24 $\to$ 4 Bits | `degrade~` | 255 $\to$ 2 Steps | `floor(col*steps)` |
| **Shutter** | 0Hz $\to$ 20Hz | `phasor~` | 0Hz $\to$ 20Hz | `sin(time * Hz)` |
| **Ghosting** | 0 $\to$ 0.8 Fdbk | `tapout~` | 0 $\to$ 0.5 Mix | Frame Buffer Mix |

-----

## Appendix I. M4L Object Compatibility (IMPORTANT)

### Objects NOT Available in M4L
These objects caused "No such object" errors:
- `gigaverb~` - Use tapin~/tapout~ instead
- `freeverb~` - Use tapin~/tapout~ instead
- `vdelay~` - Use buffer~/poke~/index~ circular buffer instead
- `wrap~` - Use `%~` (modulo) instead
- `yafr2` - Has internal `clip` objects that don't understand signals

### Objects Confirmed Working in M4L
- `buffer~`, `poke~`, `index~` - Circular buffer operations
- `tapin~`, `tapout~` - Fixed delay lines (message-rate delay time)
- `phasor~`, `scale~`, `-~`, `+~`, `*~`, `!-~`, `%~` - Basic DSP math
- `freqshift~` - Bode frequency shifter
- `line~` - Signal interpolation
- `r`, `s` - Receive/send with `---` prefix for M4L scoping

-----

Here is the updated technical appendix.

**Significant Change Note:** To support the expanded architecture, the processing has been split.

  * **`tv.audio`** now handles *only* Geometry (Scroll/Zoom/Rotate).
  * **`tv.fx`** is a **NEW** module handling the Artifacts and Space (Audio).
  * **`tv.viz`** handles the Video, with most logic moved into the `jit.gen` shader for performance.

-----

## Appendix II. tv.audio.maxpat Architecture (Geometry Core)

This module is now strictly for manipulating the time and frequency domains of the signal. It acts as the "Tape Head."

```text
Input L/R
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 1: DELAY (SCROLL)                                 │
│ buffer~ ---tv_delay_l/r → poke~ (write)                 │
│ phasor~ 0.5 → scale~ → write index                      │
│ write_idx - scroll_offset → %~ 88200 → index~ (read)    │
│ [Param] Scroll (0-1000ms) controls delay offset         │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 2: VARISPEED (ZOOM)                               │
│ buffer~ ---tv_pitch_l/r → poke~ (write at fixed rate)   │
│ phasor~ 86 → scale~ → write index                       │
│ zoom * 86 → phasor~ → scale~ → index~ (read)            │
│ [Param] Zoom (0.5-2.0) controls playback speed/pitch    │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 3: FREQ SHIFT (ROTATE)                            │
│ freqshift~                                              │
│ [Param] Rotate (-500 to +500 Hz) controls shift         │
└─────────────────────────────────────────────────────────┘
    ↓
Outlet L/R → To tv.fx.maxpat
```

### Parameter Receives

  * `r ---tv_param_scroll` → delay offset
  * `r ---tv_param_zoom` → playback speed
  * `r ---tv_param_rotate` → freq shift
  * `r ---tv_param_freeze` → gate input (stops `poke~` writing)

-----

## Appendix III. tv.fx.maxpat Architecture (Signal Artifacts)

This is a **new serial processing chain** that applies texture, distortion, and spatial effects.

```text
Input L/R (From tv.audio)
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 1: MOSAIC (Resample)                              │
│ degrade~ (Audio degradation)                            │
│ [Param] Mosaic (1.0 -> 0.05) controls sample rate       │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 2: ABERRATION (Spectral Split)                    │
│ crossover~ (Low/Mid/High)                               │
│ Mid: tapout~ (Param * 20ms)                             │
│ High: tapout~ (Param * 40ms)                            │
│ [Param] Aberration controls delay spread                │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 3: BLOOM (Saturation)                             │
│ *~ drive → tanh~ (Soft Clip) → gain comp                │
│ [Param] Bloom (1.0 -> 8.0) controls drive               │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 4: SOLARIZE (Foldover)                            │
│ pong~ -1. 1. (Wavefolding)                              │
│ [Param] Solarize controls fold threshold/gain           │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 5: CRUSH (Bit Depth)                              │
│ degrade~ (Bit quantization)                             │
│ [Param] Crush (24 -> 4) controls bit depth              │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 6: SHUTTER (Gating)                               │
│ phasor~ (LFO) → >~ 0.5 (Square Wave) → *~ Signal        │
│ [Param] Shutter (0 -> 20Hz) controls LFO rate           │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 7: GHOSTING (Slapback)                            │
│ tapin~ → tapout~ 15ms → *~ 0.8 (Feedback)               │
│ [Param] Ghosting controls wet/dry mix                   │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 8: SMEAR (Reverb)                                 │
│ FDN / Plate Reverb (Long decay)                         │
│ [Param] Smear controls wet/dry mix                      │
└─────────────────────────────────────────────────────────┘
    ↓
Outlet L/R → Main Output
```

### Parameter Receives

  * `r ---tv_param_mosaic`
  * `r ---tv_param_aberration`
  * `r ---tv_param_bloom`
  * `r ---tv_param_solarize`
  * `r ---tv_param_crush`
  * `r ---tv_param_shutter`
  * `r ---tv_param_ghosting`
  * `r ---tv_param_smear`

-----

## Appendix IV. tv.viz.maxpat Architecture (Visual Engine)

To handle the complexity of the new effects, distinct stages (like `jit.rota`) have been consolidated into a single Gen shader (`tv.core.genjit`).

```text
Bang (Frame Trigger)
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 1: INGEST                                         │
│ jit.matrix ---tv_viz_ram (Reads audio features)         │
│ jit.matrix 256 256 (Reshapes to 2D texture)             │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 2: PARAMETER COLLECTION                           │
│ r ---tv_param_* objects collect all 10 FX values        │
│ prepended as "param name value" messages                │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 3: THE SHADER (tv.core.genjit)                    │
│ This single object processes the entire chain in GPU:   │
│                                                         │
│ 1. Geometry: Offset(Scroll) -> Scale(Zoom) -> Rot(Rot)  │
│ 2. Mosaic: Quantize UV coords                           │
│ 3. Aberration: Multi-tap sample RGB                     │
│ 4. Bloom: Blur + Threshold + Add                        │
│ 5. Solarize: Luma Inversion                             │
│ 6. Crush: Quantize Color Steps                          │
│ 7. Shutter: Multiply by Black (Time LFO)                │
│ 8. Ghosting/Smear: Mix with feedback texture            │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 4: FEEDBACK LOOP                                  │
│ Output of Gen → jit.matrix ---tv_feedback               │
│ (This texture is fed back into Stage 3 input 2)         │
└─────────────────────────────────────────────────────────┘
    ↓
Outlet → Display
```

### Shader Parameter Logic (Inside tv.core.genjit)

  * **Scroll:** `offset_y`
  * **Zoom:** `scale`
  * **Rotate:** `theta`
  * **Mosaic:** `cells` (mapped 2048.0 to 10.0)
  * **Aberration:** `shift` (mapped 0.0 to 0.05)
  * **Bloom:** `intensity` (0.0 to 1.0)
  * **Solarize:** `threshold` (0.0 to 1.0)
  * **Crush:** `steps` (mapped 255.0 to 2.0)
  * **Shutter:** `freq` (0.0 to 20.0)
  * **Ghosting/Smear:** `feedback_amt` (0.0 to 0.99)
