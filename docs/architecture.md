# System Architecture: Teevee v2.5 (M4L Compatible)

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

---

## II. The Container (The Canvas)
We use a `jit.matrix` (or `jit.gl.texture` on GPU) with dimensions **256x256** (or **512x256**).

* **X-Axis (Width):** Represents the **Time Window**. Matched to the audio vector size (e.g., 256 samples, approx 5ms) to avoid interpolation artifacts.
* **Y-Axis (Height):** Represents **History**. Row 0 is "Now." Row 255 is "The Past."
* **Z-Axis (Planes):** We map signal *characteristics* rather than just L/R channels to ensure stereo coherence using an **MS-Flux Mapping**.

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
2.  **Index Generation:** `phasor~` at `samplerate/buffersize` generates cycling write position.
3.  **Capture:** `jit.poke~` writes each sample to the named matrix at the index position.
4.  **Multi-plane:** Use separate `jit.poke~` for each plane (Alpha=Dynamics, Red=Mid, Green=Flux, Blue=Side).

```
plugin~ → gen~ (encode) → jit.poke~ matrix 0 (plane 0)
                        → jit.poke~ matrix 1 (plane 1)
                        → jit.poke~ matrix 2 (plane 2)
                        → jit.poke~ matrix 3 (plane 3)
                        ↑
              phasor~ → scale~ (0 to dim-1)
```

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

### 1. The Warper (Geometric)
* **Action:** Rotates and Zooms the texture (Coordinate transformation).
* **Sonic Result:**
    * **Zoom Y:** Pitch Shifting (resampling the delay line).
    * **Rotation:** Ring Modulation (forcing Mid data into Side plane).

### 2. The Smear (Temporal)
* **Action:** Temporal interpolation (Motion Blur) via `jit.slide` or `jit.wake` logic.
* **Sonic Result:** "Spectral Freezing." Transients lose their attack. The audio decays into a wash of reverb-like texture (Datamosh aesthetic).

### 3. The Transient Excavator (Edge Detection)
* **Object:** `jit.sobel` or `jit.roberts` (Simple Matrix Math).
* **Action:** Calculates difference between adjacent pixels. Sets smooth areas to black (0), edges to white (1).
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
Navigating the Y-Axis (History) via `jit.release~`.
* **Reading Row 0:** Dry signal.
* **Reading Row 100:** Distinct Echo.
* **Modulation:** Wiggling the read position creates "Tape Slip" / "Wow and Flutter."
* **Jumps:** Rapidly jumping from Row 0 to Row 255 creates "Vertical Sync Failure" glitches.

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
| `gen~` | ✅ | Full DSP functionality |
| `jit.matrix` | ✅ | Named matrices work |
| `jit.poke~` | ✅ | Sample-rate matrix writes |
| `jit.peek~` | ✅ | Sample-rate matrix reads |
| `jit.catch~` | ❌ | No audio output |
| `jit.release~` | ❌ | No audio output |
| `jit.pwindow` | ✅ | Matrix visualization |
