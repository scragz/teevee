# System Architecture: Teevee v6 (M4L Compatible)

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

**CRITICAL:** `jit.poke~` and `jit.peek~` determine their inlet count at instantiation time based on the dimensionality of the referenced matrix. If the named matrix doesn't exist when the object loads, it defaults to 2D (3 inlets for poke, 2 for peek), causing "patchcord inlet out of range" errors.

**Problem:** In M4L and modular patchers, subpatchers may load before the parent's matrix is created.

**Solution - Explicit Dimension Count Argument:**
The `jit.poke~` and `jit.peek~` objects accept arguments in this order: `[matrix_name] [dim_inputcount] [plane]`

```
jit.poke~ tv_ram 1 0    # matrix_name=tv_ram, 1 dimension, plane 0
jit.poke~ tv_ram 1 1    # matrix_name=tv_ram, 1 dimension, plane 1
jit.peek~ tv_ram 1 0    # matrix_name=tv_ram, 1 dimension, plane 0
```

By specifying `dim_inputcount = 1`, the object will always have the correct number of inlets:
- `jit.poke~` with dim=1: 2 inlets (value + 1D index)
- `jit.peek~` with dim=1: 1 inlet (1D index)

**Matrix Setup:**
- Use `jit.matrix name 4 float32 65536` (1D with 65536 cells = 256×256)
- Compute linear index: `index = y * 256 + x`
- For visual effects that need 2D, reshape on read/write: pipe through an anonymous `jit.matrix 4 float32 256 256`

**Matrix Naming:**
- Use simple names like `tv_ram` without the `---` M4L scoping prefix for matrices shared across subpatchers
- The `---` prefix can cause issues with named matrix references in nested patchers

**Load Order (Belt & Suspenders):**
- Place the `jit.matrix` declaration FIRST in the boxes array of your main patcher JSON
- Include a reference `jit.matrix` at the top of each subpatcher that uses jit.poke~/jit.peek~
- Always specify the `dim_inputcount` argument explicitly

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
| **0 (Alpha)** | **Dynamics** | RMS Envelope (`slide(abs(Mid))`) | **Gating.** Thresholds the signal visibility. |
| **1 (Red)** | **Structure** | Mid Channel `(L+R) * 0.5` | **Pitch/Time.** Warping Red bends the fundamental waveform. |
| **2 (Green)** | **Flux** | Spectral Delta (`abs(Mid - prev_mid)`) | **Timbre.** Smearing Green creates "MP3" spectral blur. |
| **3 (Blue)** | **Space** | Side Channel `(L-R) * 0.5` | **Width.** Warping Blue expands/collapses stereo field. |

**Decoding:** To reconstruct stereo from Mid/Side:
- `L = Mid + Side` (plane 1 + plane 3)
- `R = Mid - Side` (plane 1 - plane 3)

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
plugin~ → gen~ (encode) → jit.poke~ tv_ram 1 0 (plane 0)
                        → jit.poke~ tv_ram 1 1 (plane 1)
                        → jit.poke~ tv_ram 1 2 (plane 2)
                        → jit.poke~ tv_ram 1 3 (plane 3)
                        ↑
              phasor~ → scale~ (0-255) = X
                     → edge~ → counter (0-255) = Y
                     → gen~ (Y*256 + X) = linear index
```

### gen~ Gotchas
- **Declarations first:** In gen~ codebox, `History` and `Param` declarations MUST come before any expressions
- **No floor~:** Use `trunc~` instead of `floor~` (floor~ doesn't exist in Max 8.6)
- **No wrap:** Use `expr fmod($f1, 256.)` instead of `wrap` for modulo operations outside gen~
- **No wrap~:** The `wrap~` object does not exist. Use `%~` (modulo) instead. For wrapping negative values: `+~ size` then `%~ size`

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

## V. The Transformation Engine (FX Chain)

### ⚠️ Audio-Safe vs Audio-Destroying Operations

**CRITICAL:** Most visual effects destroy audio when applied to the matrix buffer. Only integer-based operations preserve audio quality.

#### Audio-Safe Operations (Implemented)
| Operation | Method | Sonic Effect |
|-----------|--------|--------------|
| **Integer Scroll** | Add integer offset to read index, wrap with `%~` | Delay line, echo |
| **Feedback/Smear** | `new * (1-smear) + previous * smear` via jit.op | Temporal blur, reverb wash |
| **Gain** | jit.op multiply | Volume |
| **Invert** | jit.op * -1 | Phase flip |

#### Audio-Destroying Operations (NOT Implemented)
These use interpolation which smears audio into noise:
- **jit.rota rotation** - forces mid into side plane, ring mod effect but destroys signal
- **Non-integer zoom** - resampling with interpolation
- **Float scroll** - interpolated read positions
- **Warp/distortion** - any coordinate transform with non-integer positions
- **jit.slide** - temporal smoothing destroys transients
- **Edge detection** - high-pass filtering destroys fundamental

### Current Implementation (v6): CPU-Based Processing
The current working implementation uses simple CPU-based effects that preserve audio:

**tv.fx signal flow:**
```
Bang trigger
    ↓
jit.matrix tv_ram (read input)
    ↓
jit.op @op * (scale by 1-smear)
    +
jit.matrix tv_ram_out (read previous) → jit.op @op * (scale by smear)
    ↓
jit.op @op + (mix new + previous)
    ↓
jit.matrix tv_ram_out (write output)
    ↓
jit.matrix 256x256 (reshape for viz)
    ↓
jit.op @op abs → jit.op @op * 3 (boost for display)
    ↓
output to viz/pwindow
```

**tv.egress signal flow (integer scroll):**
```
Read index (0-65535 signal)
    ↓
+~ scroll_offset (integer, -32768 to 32768)
    ↓
+~ 65536. (ensure positive for negative offsets)
    ↓
%~ 65536. (wrap to valid range)
    ↓
trunc~ (ensure integer)
    ↓
jit.peek~ tv_ram_out 1 1 (read Mid)
jit.peek~ tv_ram_out 1 3 (read Side)
    ↓
M/S decode: L = Mid + Side, R = Mid - Side
    ↓
Audio output
```

### GPU Processing (Future/Planned)
GPU-based processing via `jit.gl.pix` is documented below but NOT currently active due to audio quality concerns. GPU effects would need careful design to avoid interpolation.

### GPU Signal Flow (Reference - Not Currently Active)
```
jit.matrix tv_ram (1D 65536)
    ↓
jit.matrix (reshape to 2D 256×256)
    ↓
jit.gl.texture tv_tex_in (upload to GPU)
    ↓
jit.gl.pix @file tv.core.genjit (GPU processing)
    ↓ ← jit.gl.texture tv_tex_fb (feedback from previous frame)
    ↓
jit.gl.texture tv_tex_fb (copy output for next frame feedback)
    ↓
jit.matrix (readback to CPU, 2D 256×256)
    ↓
jit.matrix (reshape to 1D 65536)
    ↓
jit.matrix tv_ram (write back for jit.peek~ audio output)
```

### OpenGL Context Setup
* **Context:** `jit.world tv_world @visible 0 @enable 1 @output_matrix 1 @dim 256 256`
* **Input Texture:** `jit.gl.texture tv_world @name tv_tex_in @type float32 @dim 256 256`
* **Feedback Texture:** `jit.gl.texture tv_world @name tv_tex_fb @type float32 @dim 256 256`
* **Processor:** `jit.gl.pix tv_world @file tv.core.genjit @type float32 @dim 256 256`

### GPU Shader: tv.core.genjit
All effects are combined in a single `jit.gl.pix` shader for optimal performance:

#### Parameters
| Param | Range | Default | Effect |
|-------|-------|---------|--------|
| `scroll_speed` | 0-1 | 0.01 | UV Y offset (waterfall scroll) |
| `zoom` | 0.25-4 | 1 | UV scaling (pitch shift) |
| `rotation` | -π to π | 0 | 2D rotation (ring mod) |
| `smear` | 0-1 | 0 | Temporal blur via History |
| `edge_amount` | 0-1 | 0 | Sobel edge detection mix |
| `warp_x` | -1 to 1 | 0 | Barrel/pincushion X |
| `warp_y` | -1 to 1 | 0 | Barrel/pincushion Y |

#### Shader Processing Order
1. **Rotation:** 2D rotation matrix applied to centered UVs
2. **Zoom:** UV scaling from center
3. **Warp:** Barrel/pincushion distortion based on distance from center
4. **Scroll:** UV Y offset with wrap for continuous waterfall
5. **Sample:** Read from feedback texture at transformed coordinates
6. **Edge Detection:** Sobel-style edge detection via neighbor sampling
7. **Smear:** Temporal interpolation with previous frame via `History`
8. **Output:** Final processed pixel

### Sonic Results (GPU - Planned)
* **Scroll:** Creates the continuous history/delay buffer
* **Zoom:** Pitch shifting (resampling the delay line) - ⚠️ destroys audio via interpolation
* **Rotation:** Ring modulation (forces Mid data into Side plane) - ⚠️ destroys audio
* **Smear:** "Spectral Freezing" - transients lose attack, decays into reverb wash
* **Edge:** Rhythmic extraction - strips body/bass, leaves click/attack - ⚠️ destroys audio
* **Warp:** Barrel/pincushion creates frequency-dependent time smearing - ⚠️ destroys audio

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
| `jit.poke~` | ✅ | Use `jit.poke~ name dim_count plane` syntax (e.g., `jit.poke~ tv_ram 1 0`) |
| `jit.peek~` | ✅ | Use `jit.peek~ name dim_count plane` syntax (e.g., `jit.peek~ tv_ram 1 0`) |
| `jit.catch~` | ❌ | No audio output in M4L |
| `jit.release~` | ❌ | No audio output in M4L |
| `jit.pwindow` | ✅ | Matrix visualization |
| `jit.rota` | ✅ | Geometric transforms |
| `jit.slide` | ✅ | Temporal smoothing |
| `jit.sobel` | ✅ | Edge detection |
| `jit.xfade` | ✅ | Matrix crossfade |
| `jit.world` | ✅ | OpenGL context for GPU processing |
| `jit.gl.texture` | ✅ | GPU texture for upload/readback |
| `jit.gl.pix` | ✅ | GPU shader processing |
| `trunc~` | ✅ | Use instead of floor~ |
| `floor~` | ❌ | Does not exist in Max 8.6 |
| `wrap` | ❌ | Use `expr fmod()` instead |
| `wrap~` | ❌ | Does not exist. Use `%~` (modulo) instead |
| `%~` | ✅ | Modulo for signals. For wrapping negative: `+~ size` then `%~ size` |

---

## IX. Current Module Structure (v6)

```
teevee.amxd
  └── tv.main.maxpat (orchestrator)
        ├── jit.matrix tv_ram 4 float32 65536 (input buffer)
        ├── jit.matrix tv_ram_out 4 float32 65536 (output buffer)
        ├── tv.sync.maxpat (timing/index generation)
        ├── tv.ingest.maxpat (audio→matrix via jit.poke~)
        ├── tv.fx.maxpat (feedback/smear processing)
        ├── tv.egress.maxpat (matrix→audio via jit.peek~ with scroll)
        └── tv.viz.maxpat (visualization)
```

### Module Communication
- **Send/Receive:** Parameters use `---tv_param_*` naming (with M4L scoping prefix)
- **Named Matrices:** `tv_ram` (input) and `tv_ram_out` (processed output)
- **Y Counter:** `---tv_write_y` broadcasts current write row from tv.sync

### Parameters (v6)
| Parameter | Bus Name | Range | Default | Effect |
|-----------|----------|-------|---------|--------|
| Scroll | `---tv_param_scroll` | 0-1 | 0.5 | Read offset (0.5 = no offset, 0/1 = ±32768 samples) |
| Smear | `---tv_param_smear` | 0-1 | 0 | Feedback mix (0 = clean, 1 = full freeze) |

---

## X. Known Issues & Status

### ✅ Working (v6)
- **Stereo audio passthrough** via jit.poke~/jit.peek~ pipeline
- **MS encoding/decoding** - Mid/Side encoding in tv.ingest, proper L/R reconstruction in tv.egress
- **1D matrix approach** with explicit dim_inputcount arguments eliminates load-order issues
- **Integer scroll** - read offset in tv.egress for delay/echo effects
- **Feedback/Smear** - temporal mixing in tv.fx for reverb-like effects
- **Two named matrices** - tv_ram (input) and tv_ram_out (processed) for proper separation
- **Simplified UI** - 2 knobs (Scroll, Smear) that actually work

### ⚠️ Gotchas Discovered
- `wrap~` does not exist in Max - use `%~` with `+~ size` to handle negatives
- `floor~` does not exist in Max 8.6 - use `trunc~`
- Most GPU/visual effects destroy audio due to interpolation
- jit.rota, zoom, warp all use interpolation and turn audio to noise
- Only integer-based read offsets preserve audio quality

### Future Work (Planned)
- **Datamosh freeze** - stop scroll + ingest while keeping smear active
- **Y-axis scrubbing** - manual history navigation via read Y offset
- **Audio-safe GPU effects** - investigate integer-only GPU operations
- **Reaction-Diffusion** - may work if coefficients are audio-preserving
- **Performance profiling** - optimize if CPU becomes bottleneck
- **Additional audio-safe effects:**
  - Gain/volume control
  - Phase invert
  - Bit depth reduction (quantization)
  - Sample-and-hold (integer intervals only)
