# System Architecture: Teevee v5 (M4L Compatible)

## I. Core Concept
Teevee is a **Feedback Ring Buffer** acting as a real-time "Slit-Scan" audio processor. We turn a stream of time (Audio) into a static block of memory (Video), manipulate it via GPU shaders, and decode it back into time.

* **Architecture:** `jit.poke~` (Sample Write) $\to$ Feedback Scroll (GPU Waterfall) $\to$ FX Chain $\to$ `jit.peek~` (Sample Read).
* **Optimization Target:** All video processing occurs in `jit.gl.pix` or `jit.gen` to maintain 60fps refresh rates alongside audio processing.

---

## ⚠️ Max for Live Compatibility

**CRITICAL:** `jit.catch~` and `jit.release~` do NOT work in M4L audio effects - they produce no audio output.

**Solution:** Use `jit.poke~` / `jit.peek~` for sample-by-sample matrix I/O:
- Works reliably in M4L
- Requires index signal from `phasor~` scaled to matrix dimensions
- Provides equivalent functionality with more explicit control

### Named Matrix & jit.poke~/jit.peek~ Gotchas

**CRITICAL:** `jit.poke~` and `jit.peek~` determine their inlet count at instantiation time based on the dimensionality of the referenced matrix. If the named matrix doesn't exist when the object loads, it defaults to 1D (2 inlets for poke, 1 for peek).

**Problem:** In M4L and modular patchers, subpatchers may load before the parent's matrix is created, causing "patchcord inlet out of range" errors.

**Solution - Use 1D Matrix:**
- Use `jit.matrix name 4 float32 65536` (1D with 65536 cells = 256×256)
- Compute linear index: `index = y * 256 + x`
- This guarantees consistent inlet counts regardless of load order
- For visual effects that need 2D, reshape on read/write: pipe through an anonymous `jit.matrix 4 float32 256 256`

**Matrix Naming:**
- Use simple names like `tv_ram` without the `---` M4L scoping prefix for matrices shared across subpatchers
- The `---` prefix can cause issues with named matrix references in nested patchers

**Load Order:**
- Place the `jit.matrix` declaration FIRST in the boxes array of your main patcher JSON
- Include a reference `jit.matrix` at the top of each subpatcher that uses jit.poke~/jit.peek~

---

## II. The Container (The Canvas)
We use a `jit.matrix` with **65536 cells** (logical 256×256 stored as 1D for M4L compatibility).

* **X-Axis (Width):** Represents the **Time Window**. Matched to the audio vector size (e.g., 256 samples, approx 5ms) to avoid interpolation artifacts.
* **Y-Axis (Height):** Represents **History**. Row 0 is "Now." Row 255 is "The Past."
* **Z-Axis (Planes):** We map signal *characteristics* rather than just L/R channels to ensure stereo coherence using an **MS-Flux Mapping**.
* **1D Storage:** For M4L compatibility, stored as 1D array with linear indexing: `index = y * 256 + x`

### The MS-Flux Data Structure
| Plane | Component | Source Logic | Manipulation Result |
| :--- | :--- | :--- | :--- |
| **Alpha** | **Dynamics** | RMS Envelope | **Gating.** Thresholds the signal visibility. |
| **Red** | **Structure** | Mid Channel (L+R) | **Pitch/Time.** Warping Red bends the fundamental waveform. |
| **Green** | **Flux** | Spectral Delta (Hi-Pass) | **Timbre.** Smearing Green creates "MP3" spectral blur. |
| **Blue** | **Space** | Side Channel (L-R) | **Width.** Warping Blue expands/collapses stereo field. |

* **Data Type:** Must use `float32`. **Do not use `char`.** `Char` (0-255) has insufficient dynamic range for audio and will sound like an 8-bit noise floor.

---

## III. The Ingest (Audio $\to$ Video)

### M4L Approach: jit.poke~
1.  **Encoding:** Audio enters `gen~` for MS-Flux encoding (L/R → Mid/Side/Dynamics/Flux).
2.  **Index Generation:** `phasor~` at `samplerate/buffersize` generates cycling X position (0-255). Y position increments on phasor wrap via `edge~` → `counter`.
3.  **Linear Index:** Compute `index = y * 256 + x` in gen~ or with signal math.
4.  **Capture:** `jit.poke~` writes each sample to the 1D matrix at the linear index.
5.  **Multi-plane:** Use separate `jit.poke~` for each plane (Alpha=Dynamics, Red=Mid, Green=Flux, Blue=Side).

```
plugin~ → gen~ (encode) → jit.poke~ matrix 0 (plane 0)
                        → jit.poke~ matrix 1 (plane 1)
                        → jit.poke~ matrix 2 (plane 2)
                        → jit.poke~ matrix 3 (plane 3)
                        ↑
              phasor~ → scale~ (0-255) = X
                     → edge~ → counter (0-255) = Y
                     → gen~ (Y*256 + X) = linear index
```

### gen~ Gotchas
- **Declarations first:** In gen~ codebox, `History` and `Param` declarations MUST come before any expressions
- **No floor~:** Use `trunc~` instead of `floor~` (floor~ doesn't exist in Max 8.6)
- **No wrap:** Use `expr fmod($f1, 256.)` instead of `wrap` for modulo operations outside gen~

### Legacy Approach (standalone Max only)
1.  **Encoding:** Audio enters `gen~` for MS-Flux encoding.
2.  **Capture:** `jit.catch~` grabs a chunk of 256 samples.
3.  **Placement:** It writes this new chunk strictly to **Row 0** (the top line) of the matrix.

---

## IV. The Scroll (The Feedback Loop & GPU Pivot)
To create the "waterfall" or "history," data must move down every frame.

### The CPU Failure (Context)
Originally, we attempted to use `srcdim`/`dstdim` commands on a CPU `jit.matrix`.
* **The Logic:** Copy top 255 rows $\to$ Paste to bottom 255 rows $\to$ Write new audio to Row 0.
* **Why it failed:** `jit.matrix` is a storage bucket, not a processor. Moving pixels on the CPU is brittle, slow, and causes Ableton to choke when scaling up.

### The GPU Solution
The correct method is to move immediately to **OpenGL (GPU)**.
* **Object:** `jit.gl.pix` (Texture processing).
* **Mechanism:** We use Texture Coordinates. In a shader, we mathematically state `out = in1(pixel_above)`.
* **Benefit:** The GPU handles "moving pixels down" natively with almost zero processing cost.

---

## V. The Transformation Engine (Optimized FX Chain)
This engine replaces heavy CPU objects (like `jit.sort`) with lightweight, high-impact topology modifiers inside `jit.gl.pix`.

**Current Implementation (v5):** Uses CPU-based `jit.rota` → `jit.slide` → `jit.sobel` chain with `jit.xfade` for edge mixing. GPU migration to `jit.gl.pix` is planned for performance optimization.

**1D→2D Reshape:** Since the shared matrix is 1D for M4L compatibility, the FX module reshapes to 2D for processing:
```
jit.matrix tv_ram (1D) → jit.matrix (anonymous 2D 256x256) → effects → jit.matrix (anonymous 1D) → jit.matrix tv_ram (1D)
```

### 1. The Warper (Geometric)
* **Object:** `jit.rota` with `@boundmode 1 @interp 1`
* **Action:** Rotates and Zooms the texture (Coordinate transformation).
* **Parameters:** `zoom_x`, `zoom_y`, `theta`, `offset_y` (scroll), `anchor_x`, `anchor_y`
* **Sonic Result:**
    * **Zoom Y:** Pitch Shifting (resampling the delay line).
    * **Rotation:** Ring Modulation (forcing Mid data into Side plane).

### 2. The Smear (Temporal)
* **Object:** `jit.slide` with `@slide_up` and `@slide_down`
* **Action:** Temporal interpolation (Motion Blur) via exponential smoothing.
* **Sonic Result:** "Spectral Freezing." Transients lose their attack. The audio decays into a wash of reverb-like texture (Datamosh aesthetic).

### 3. The Transient Excavator (Edge Detection)
* **Object:** `jit.sobel` (Simple Matrix Math).
* **Action:** Calculates difference between adjacent pixels. Sets smooth areas to black (0), edges to white (1).
* **Mixing:** `jit.xfade` blends between original and edge-detected signal.
* **Sonic Result:** **Rhythmic Extraction.** Strips body/bass (smooth gradients) and leaves only the click/attack.
* **Optimization:** $O(N)$ complexity vs `jit.sort`'s $O(N \log N)$.

### 4. The Living Texture (Reaction-Diffusion)
* **Action:** A cellular automata rule where pixels "grow" into neighbors based on brightness.
* **Sonic Result:** **Generative Noise.** A single snare hit "blooms" into a self-propagating noise cluster.

---

## VI. Interaction & Control

### 1. The Datamosh Break (The Freeze)
A momentary performance switch.
* **Logic:** Stop `jit.catch~` (Ingest) + Stop Waterfall Scroll + **Keep Processing**.
* **Result:** The audio loop freezes in time, but the *texture* continues to degrade and morph via the Smear and Warper. It sounds like file corruption, not a digital looper.

### 2. The Scanline Scrubber (Tape Slip)
Navigating the Y-Axis (History) via `jit.peek~`.
* **Reading Row 0:** Dry signal.
* **Reading Row 100:** Distinct Echo.
* **Modulation:** Wiggling the read position creates "Tape Slip" / "Wow and Flutter."
* **Jumps:** Rapidly jumping from Row 0 to Row 255 creates "Vertical Sync Failure" glitches.
* **Implementation:** Read Y position scaled 0-255, combined with X from phasor, compute linear index for jit.peek~.

---

## VII. Implementation Strategy
To avoid CPU spikes and latency:

1.  **Single Shader:** The Scroll, Warp, Edge Detection, and Reaction should ideally be combined into a single `jit.gl.pix` or `jit.gen` patcher to avoid passing textures between multiple objects.
2.  **Disable Adaptation:** Set `@adapt 0` on all Jitter objects. Resizing matrices mid-stream causes audio dropouts.
3.  **M4L Audio I/O:** Use `plugin~ 2 2` and `plugout~ 1 2` for stereo audio (NOT `inlet`/`outlet`).
4.  **M4L Matrix I/O:** Use `jit.poke~` / `jit.peek~` with `phasor~` index (NOT `jit.catch~` / `jit.release~`).
5.  **Signal Flow Summary (M4L):**
    * Audio In $\to$ `plugin~` $\to$ `gen~` (Encode) $\to$ `jit.poke~` $\to$ **jit.matrix** $\to$ GPU (via texture) $\to$ **jit.matrix** $\to$ `jit.peek~` $\to$ `gen~` (Decode) $\to$ `plugout~` $\to$ Audio Out.

---

## VIII. Verified Working Objects in M4L

| Object | Works in M4L | Notes |
|--------|-------------|-------|
| `plugin~` / `plugout~` | ✅ | Required for M4L audio I/O |
| `inlet` / `outlet` | ❌ | No audio in M4L effects |
| `gen~` | ✅ | Full DSP functionality. Declarations must come first in codebox. |
| `jit.matrix` | ✅ | Named matrices work. Use 1D for consistent jit.poke~/jit.peek~ inlet counts. |
| `jit.poke~` | ⚠️ | Works but inlet count depends on matrix dimensionality at load time. Use 1D matrix. |
| `jit.peek~` | ⚠️ | Works but inlet count depends on matrix dimensionality at load time. Use 1D matrix. |
| `jit.catch~` | ❌ | No audio output in M4L |
| `jit.release~` | ❌ | No audio output in M4L |
| `jit.pwindow` | ✅ | Matrix visualization |
| `jit.rota` | ✅ | Geometric transforms |
| `jit.slide` | ✅ | Temporal smoothing |
| `jit.sobel` | ✅ | Edge detection |
| `jit.xfade` | ✅ | Matrix crossfade |
| `trunc~` | ✅ | Use instead of floor~ |
| `floor~` | ❌ | Does not exist in Max 8.6 |
| `wrap` | ❌ | Use `expr fmod()` instead |

---

## IX. Current Module Structure (v5)

```
teevee-v5.amxd
  └── tv.main.maxpat (orchestrator)
        ├── jit.matrix tv_ram 4 float32 65536 (master 1D buffer)
        ├── tv.sync.maxpat (timing/index generation)
        ├── tv.ingest.maxpat (audio→matrix via jit.poke~)
        ├── tv.egress.maxpat (matrix→audio via jit.peek~)
        ├── tv.fx.maxpat (visual effects chain)
        ├── tv.param.maxpat (parameter distribution)
        └── tv.viz.maxpat (visualization)
```

### Module Communication
- **Send/Receive:** Parameters use `---tv_param_*` naming (with M4L scoping prefix)
- **Named Matrix:** Uses `tv_ram` (without prefix) for cross-subpatcher matrix access
- **Y Counter:** `---tv_write_y` broadcasts current write row from tv.sync

---

## X. Known Issues & Status

### Currently Non-Functional
- Audio passthrough not yet verified working end-to-end
- Visual feedback loop not yet producing visible output
- GPU migration (`jit.gl.pix`) not yet implemented

### Implemented but Untested
- MS-Flux encoding in tv.ingest gen~
- ARGB→stereo decoding in tv.egress gen~
- jit.rota/jit.slide/jit.sobel effect chain
- live.dial parameter controls

### Future Work
- GPU-based effects via `jit.gl.pix` for performance
- Reaction-Diffusion cellular automata effect
- Datamosh freeze functionality
- Warp X/Y distortion effects
