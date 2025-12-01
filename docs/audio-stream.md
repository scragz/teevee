The audio stream is periodically sliced into frames, turned into matrices/textures, processed on the GPU, and then reconstructed as audio using a matching frame rate and vector size. The key is keeping the MSP signal block size aligned with your matrix X dimension and keeping everything in float32 for round‑trip fidelity.[1][2][3]

Below is the full pipeline, concept‑by‑concept, using canonical Max/Jitter objects.

---

## ⚠️ Max for Live Compatibility Note

**CRITICAL FINDING:** In Max for Live (M4L) audio effects, `jit.catch~` and `jit.release~` do NOT work - they produce no audio output. This appears to be a threading/scheduling issue specific to M4L's audio context.

**Working Alternative:** Use `jit.poke~` and `jit.peek~` instead:
- `jit.poke~` writes audio samples to a named `jit.matrix` at signal-rate
- `jit.peek~` reads audio samples from a named `jit.matrix` at signal-rate
- Both require an index signal (e.g., from `phasor~` scaled to matrix dimensions)

This sample-by-sample approach works reliably in M4L and provides equivalent functionality for audio↔matrix round-trips.

---

## 1. Input: MSP audio domain

Your starting point is just standard MSP signals (adc~, plugin~ outputs, etc.), but a couple of details matter before you hit Jitter.

- Audio is running at the MSP I/O vector size; that vector size determines how many samples you see at once in objects like jit.catch~ and jit.release~.[1]
- For frame‑based processing, you want a clean mapping such that “one MSP vector = one X‑axis row segment (or full row) of your matrix,” so you know exactly how time maps to pixels.[1]

Relevant concept:
- Signal vectors: MSP processes audio in blocks; all the audio→video machinery is synchronized to those blocks so reconstruction with jit.release~ is artifact‑free.[3][1]

## 2. Audio → Matrix: MSP into Jitter

This is the first domain boundary: turning sample streams into numeric grids.

Two main idioms exist:

- jit.poke~ (sample‑driven writes, you control coordinates) - **USE THIS FOR M4L**
- jit.catch~ (vector/frame‑driven capture, it outputs matrices "for you") - **BROKEN IN M4L**

### For Max for Live: jit.poke~ approach

Since `jit.catch~` doesn't work in M4L, use `jit.poke~` with a cycling index:

```
phasor~ 46.87 → scale~ 0 1 0 1023 → jit.poke~ matrixname plane
                                  ↑
                        audio signal input
```

- Create a named matrix: `jit.matrix myaudio 4 float32 1024` (4 planes for ARGB, 1024 samples)
- Use `phasor~` at `samplerate/buffersize` Hz to generate a cycling write position
- `jit.poke~` writes each audio sample to the matrix at the index position
- For multiple planes (MS-Flux), use multiple `jit.poke~` objects writing to different planes

### For standalone Max: jit.catch~ approach (reference only)

For your slit‑scan / ring buffer design, jit.catch~ is the right core primitive in standalone Max.

- jit.catch~ takes incoming MSP signals and, each time it outputs, produces a Jitter matrix whose cells contain the most recent signal samples as float32 values.[4][5]
- In its typical mode, you set the output matrix dimensions (e.g., 256×1 or 256×N planes) and it fills along X with sequential audio samples until N samples are gathered, then outputs a frame.[5][1]

Key concepts for jit.catch~:
- It is signal‑driven: it listens continuously and internally accumulates samples according to your vector/buffer settings.[1]
- On output (either by bang or automatic modes), you get a matrix of type float32 where each cell is a sample; the “dim” dimension is the number of samples per frame.[4][5]

Mapping this to your architecture:
- X = vector length (e.g. 256 samples) → one line of “now audio” per frame.[1]
- Planes = MS-Flux data (you’d usually do M/S and auxiliary analysis in gen~/MSP, then route into multiple jit.catch~ channels or pack into planes).

If you ever wanted more manual control of write coordinates (e.g., drawing audio into arbitrary positions in a 2D buffer), jit.poke~ is the other canonical option; it writes sample values into a named jit.matrix at positions specified by MSP signals for X/Y.[6]

## 3. Matrix → Texture: moving to GPU / screen

Once audio is in a matrix, you can either work in CPU Jitter or promote it to a GPU texture for speed and rendering.

- jit.matrix is a CPU‑resident grid of values; each frame from jit.catch~ is a matrix that can be processed by CPU Jitter objects.[5]
- jit.gl.texture is the GPU equivalent; it stores image/texture data in VRAM and is the native format for jit.gl.pix, jit.gl.slab, etc.[7][2]

Core texture concepts:
- Texture type and dim: you explicitly set @type float32 and @dim 256 256 (or similar) on the jit.gl.texture to ensure enough dynamic range and correct geometry for your delay line.[2][8]
- Plane count: textures always have four planes (RGBA); that maps cleanly to your Alpha/Red/Green/Blue MS‑Flux layout.[8][2]

To get from matrix to screen:

- jit.world encapsulates jit.window, jit.gl.render, and the basic OpenGL context; it can output to a window and optionally capture the rendered result as a matrix/texture.[9]
- You typically send the audio‑derived texture into some GL object (jit.gl.gridshape, jit.gl.mesh, or direct full‑screen quad via jit.world) and use it as a texture, so “audio as image” becomes visible as a scrolling waterfall.[2][9]

Your pipeline at this stage:
- MSP → jit.catch~ → jit.matrix (float32, 4 planes) → jit.gl.texture → jit.world/jit.gl.* for visualization.[9][2][1]

## 4. Screen‑space processing: textures on the GPU

This is still “video” domain, but specifically GPU‑side.

- jit.gl.pix is a Gen‑based pixel shader: for each pixel, it reads from input textures and writes to an output texture; all operations are per‑pixel and massively parallel.[10][11]
- Inside jit.gl.pix you work in normalized texture coordinates (0–1 across X/Y) and apply coordinate warps, feedback, mixing, etc., which is where your scroll, warping, smearing, and reaction‑diffusion live.[11][10]

Important concepts:
- Feedback: You can feed the output of jit.gl.pix back into its input texture each frame (through a named jit.gl.texture or jit.gl.node), creating the waterfall/scroll without CPU copies.[11][2]
- Coordinate transforms: By altering UV coordinates before sampling the input texture, you implement vertical shifts (scrolling), scaling (pitch/time warping), and rotations (ring‑mod‑like interactions between channels/planes).[10][11]

At this stage the texture is both:
- A visual object on screen (rendered by jit.world/jit.gl.*), and
- A high‑resolution delay buffer of float32 samples arranged as pixels.

## 5. Texture/Matrix → Audio: Jitter back to MSP

To return from video/matrix domain back to audio:

### For Max for Live: jit.peek~ approach

Since `jit.release~` doesn't work in M4L, use `jit.peek~` with a cycling index:

```
phasor~ 46.87 → scale~ 0 1 0 1023 → jit.peek~ matrixname plane → audio out
```

- Use the same index signal as `jit.poke~` for zero-latency passthrough
- Or offset/modulate the read index for delay/pitch effects
- `jit.peek~` outputs the sample value at the given matrix position

### For standalone Max: jit.release~ approach (reference only)

- jit.release~ takes floating‑point Jitter matrices as input and turns each matrix into one or more MSP signal vectors.[12][3][1]
- It expects a consistent frame rate and matrix size so it can output at the correct signal rate without gaps or overlaps; usually you drive it with the same block structure that fed jit.catch~ (or a compatible one).[3][1]

Conceptually:
- Each time jit.release~ receives a matrix, it reads its cells (e.g., 256 samples in X), converts them to sample vectors, and outputs them as MSP signals, sample‑accurately in the signal scheduler.[12][3]
- If your matrix has multiple planes or columns, you can map those to multiple signal channels or interpret them as multichannel data depending on settings.[13][1]

In your slit‑scan buffer:
- The Y coordinate you read from encodes “time offset” (history), so by choosing which row to convert via jit.release~ or by mapping a slice into a new 1D matrix, you control delay/echo position.[5][1]
- As long as your processing preserves the float32 values within a known range, jit.release~ will faithfully reconstruct them into an MSP signal with minimal loss.

## 6. Output: MSP domain again

After jit.release~, everything is back in familiar MSP territory.

- The decoded MSP signals can be post‑processed (filter~, compressor~, etc.) and then sent to dac~ or a plugin host output.[3][1]
- Latency and artifacts are governed by the total buffering: the MSP vector size, the number of matrix rows corresponding to your history depth, and any extra scheduling/jitter from the Jitter GL pipeline.[5][1]

At a block‑level, the full round trip is:

- Input MSP (adc~/plugin) →
- jit.catch~ (MSP→matrix frames, float32) →
- jit.matrix / jit.gl.texture (storage) →
- jit.gl.pix + GL pipeline (visual + DSP‑like processing) →
- back to jit.matrix if needed (texture→matrix readback) →
- jit.release~ (matrix→MSP) →
- MSP mix/master → dac~/host output.[2][3][1]

If you want, next step can be sketching the minimum object graph for this pipeline (no FX, just identity round‑trip) and then layering in your MS‑Flux planes and scroll logic.

[1](https://docs.cycling74.com/max8/tutorials/jitterchapter48)
[2](https://docs.cycling74.com/userguide/jitter/textures/)
[3](https://docs.cycling74.com/max8/refpages/jit.release~)
[4](https://docs.cycling74.com/legacy/max8/refpages/jit.catch~)
[5](https://docs.cycling74.com/learn/articles/jitterchapter00j_audio-into-a-matrix/)
[6](https://docs.cycling74.com/max8/tutorials/jitterchapter27)
[7](https://docs.cycling74.com/max7/refpages/jit.gl.texture)
[8](https://www.youtube.com/watch?v=aMDPmgm-o6I)
[9](https://docs.cycling74.com/max7/refpages/jit.world)
[10](https://docs.cycling74.com/reference/jit.gl.pix)
[11](https://cycling74.com/tutorials/my-favorite-object-jit-gl-pix)
[12](https://docs.cycling74.com/max7/refpages/jit.release~)
[13](https://cycling74.com/forums/convert-jitter-matrix-into-audio-signal)
[14](https://cycling74.com/forums/understanding-jit-catch-signal-data-to-matrices-and-others)
[15](https://www.facebook.com/groups/maxmspjitter/posts/10162646260229392/)
[16](https://www.youtube.com/watch?v=Y_fUh90H2QI)
[17](https://www.facebook.com/groups/maxmspjitter/posts/10158501310179392/)
[18](https://www.youtube.com/watch?v=hxJpsqrJ4Vs)
[19](https://www.sabinacovarrubias.com/jitter-max-msp-advantages)
[20](https://www.youtube.com/watch?v=Jz41Q5eiCKE)
[21](https://www.youtube.com/watch?v=yUr4KqBSvP4)
[22](https://www.youtube.com/watch?v=GZqaBRBPB0k)
