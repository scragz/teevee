This implementation plan guides you through refactoring **Teevee** from its current prototype state into the complete **Parallel Twin Engine** architecture defined in your specs.

### **Phase 1: The Architectural Split**

*Goal: Separate "Geometry" from "Artifacts" and strictly define the Audio vs. Video domains.*

Currently, your `tv.fx.maxpat` is handling visual effects. **This will change.**

  * **Old `tv.fx`**: Visual Processing (jit.rota, feedback).
  * **New `tv.fx`**: **Audio Artifacts** (Distortion, Bitcrush, Gating).
  * **New `tv.viz`**: **Visual Processing** (Container for the `jit.gen` shader).

#### **Step 1: Clean `tv.main.maxpat`**

1.  Disconnect `tv.fx` from the visual chain.
2.  Re-route the **Audio Chain** (Path A):
      * `plugin~` $\to$ `tv.audio` $\to$ **[NEW]** `tv.fx` $\to$ `plugout~`.
3.  Re-route the **Visual Chain** (Path B):
      * `tv.ingest` $\to$ **[NEW]** `tv.viz`.
      * (*Note: `tv.viz` will now host the shader logic that was previously in `tv.fx`.*)

#### **Step 2: Strip `tv.audio.maxpat`**

This module becomes the "Tape Head" (Geometry only).

1.  **Keep**: Stage 1 (Delay/Scroll), Stage 2 (Varispeed/Zoom), Stage 3 (FreqShift/Rotate).
2.  **Remove**: Stage 4 (Reverb/Smear).
      * *Why:* Smear is now the final stage of the **Artifacts** chain in `tv.fx` to ensure tails aren't chopped by the Shutter.

-----

### **Phase 2: Build the Audio Artifacts Engine (`tv.fx.maxpat`)**

*Goal: Create a serial chain of MSP objects for texture and space.*

**Action:** Clear the contents of `tv.fx.maxpat` (previously visual) and build this audio chain:

1.  **Inlets:** Audio L, Audio R.
2.  **Stage 1: MOSAIC (Resolution)**
      * **Object:** `degrade~`
      * **Param:** `mosaic` (1.0 $\to$ 0.05). Map to `sampling_rate_ratio`.
3.  **Stage 2: ABERRATION (Spectral Split)**
      * **Logic:** Split bands, delay highs.
      * **Objects:** `svf~` (or `cross~`) to split Low/Mid/High.
      * **Processing:**
          * Low: Pass through.
          * Mid: `tapout~` (Param \* 20ms).
          * High: `tapout~` (Param \* 40ms).
4.  **Stage 3: BLOOM (Saturation)**
      * **Objects:** `*~` (Gain) $\to$ `tanh~` (Soft Clip) $\to$ `*~` (Compensation).
5.  **Stage 4: SOLARIZE (Foldover)**
      * **Object:** `pong~ 1 -1 1` (Standard MSP object for folding).
      * **Param:** `solarize` controls input gain into the fold.
6.  **Stage 5: CRUSH (Quantization)**
      * **Object:** `degrade~`
      * **Param:** `crush`. Map to `bit_depth` (24 $\to$ 4).
7.  **Stage 6: SHUTTER (Gating)**
      * **Object:** `phasor~` $\to$ `>~ 0.5` $\to$ `*~` (Signal Multiplier).
      * **Param:** `shutter` controls `phasor~` frequency (0 $\to$ 20Hz).
8.  **Stage 7: GHOSTING (Lag)**
      * **Logic:** Metallic Slapback.
      * **Objects:** `tapin~` $\to$ `tapout~ 15` $\to$ Feedback Loop (`*~ 0.8`).
9.  **Stage 8: SMEAR (Space)**
      * **Logic:** Move the Reverb logic here (from `tv.audio`).
      * *Why Last:* To wash out the artifacts and chopping if desired.

-----

### **Phase 3: The Unified Visual Shader (`tv.core.genjit`)**

*Goal: Consolidate all visual processing into a single GPU pass.*

**Action:** Update the code in `tv.core.genjit`. It currently has Scroll/Zoom/Rotate. You need to paste the new algorithms from your plan **in this specific order**:

```glsl
// 1. GEOMETRY (Existing)
// ... (Scroll, Zoom, Rotate logic) ...

// 2. MOSAIC (New)
Param mosaic(0);
float cells = mix(2048.0, 10.0, mosaic);
vec2 st = floor(uv_feedback * cells) / cells;

// 3. ABERRATION (New)
Param aberration(0);
float shift = aberration * 0.05;
// Sample Red at +shift, Blue at -shift
float r = sample(feedback_frame, st + vec2(shift, 0)).r;
float g = sample(feedback_frame, st).g;
float b = sample(feedback_frame, st - vec2(shift, 0)).b;
vec4 col = vec4(r, g, b, 1.0);

// 4. BLOOM (New)
Param bloom(0);
// ... Insert 4-tap blur code from plan-more-new-effects.md ...
// Add bloom to 'col'

// 5. SOLARIZE (New)
Param solarize(0);
if (solarize > 0) {
    col.rgb = abs(col.rgb - solarize);
}

// 6. CRUSH (New)
Param crush(0);
float steps = mix(255.0, 2.0, pow(crush, 0.5));
col.rgb = floor(col.rgb * steps) / steps;

// 7. SHUTTER (New)
Param shutter(0);
Param time(0);
// ... Insert Square Wave logic from plan-more-new-effects.md ...
// Multiply 'col' by mask

// 8. OUTPUT
out1 = col;
```

-----

### **Phase 4: Update `tv.viz.maxpat`**

*Goal: Make this the container for the visual engine.*

1.  **Inlet:** Audio Features Matrix (from `tv.ingest`).
2.  **Parameters:** Add `r ---tv_param_*` objects for **all 10 effects**.
      * Scroll, Zoom, Rotate, Smear (Existing).
      * Mosaic, Aberration, Bloom, Solarize, Crush, Shutter, Ghosting (New).
3.  **Shader:** Use `jit.gl.pix` or `jit.gen` referencing `@gen tv.core.genjit`.
      * Connect the Matrix to Input 1.
      * Connect a Feedback path to Input 2 (Texture feedback).
4.  **Display:** Output to `jit.pwindow` or `jit.world`.

-----

### **Phase 5: Routing (`tv.param.maxpat`)**

*Goal: Add the 7 new knobs.*

1.  **New Inlets:** Add inlets 9-15 for the new effects.
2.  **Dual Scaling:** For each new parameter, create the split scaling logic:
      * **Audio Scale:** e.g., Mosaic 0-1 $\to$ 1.0-0.05. Send to `tv_audio_mosaic`.
      * **Visual Scale:** e.g., Mosaic 0-1 $\to$ 2048-10. Send to `tv_param_mosaic`.
      * *(Refer to "Parameter Scaling Reference" in `architecture.md` for exact values).*

### **Refactoring Checklist**

  * [ ] **Delete** visual logic from `tv.fx.maxpat`.
  * [ ] **Move** Reverb from `tv.audio` to `tv.fx`.
  * [ ] **Update** `tv.core.genjit` with the full GLSL code block.
  * [ ] **Reconnect** `tv.main` to route Audio $\to$ FX $\to$ Out.
  * [ ] **Verify** `tv.ingest` is only sending data to `tv.viz`, not `tv.fx`.
