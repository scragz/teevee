# Implementation Plan: New Effects

This document outlines the technical implementation steps for adding Mosaic, Solarize, Aberration, and Ghosting effects to the Teevee system.

## 1. Architecture Changes

We will introduce a new Gen~ patcher `code/tv.effects.gendsp` to handle the audio side of these effects efficiently. This keeps the main `tv.audio.maxpat` clean and leverages Gen's performance for per-sample processing.

For video, we will modify the existing `code/tv.core.genjit` to include the new visual effects.

## 2. Parameter Routing (`modules/tv.param.maxpat`)

We need to expose 4 new parameters to the system.

**New Inlets:**
- Inlet 10: `Mosaic` (0-1)
- Inlet 11: `Solarize` (0-1)
- Inlet 12: `Aberration` (0-1)
- Inlet 13: `Ghosting` (0-1)

**Scaling & Routing:**
- **Mosaic**:
    - Audio: `scale 0. 1. 1. 0.` (Inverse amount for quality?) or `0. 1.` -> Send to `tv_audio_mosaic`
    - Viz: `scale 0. 1. 0. 1.` -> Send to `tv_param_mosaic`
- **Solarize**:
    - Audio: `scale 0. 1. 0. 1.` -> Send to `tv_audio_solarize`
    - Viz: `scale 0. 1. 0. 1.` -> Send to `tv_param_solarize`
- **Aberration**:
    - Audio: `scale 0. 1. 0. 100.` (ms delay spread) -> Send to `tv_audio_aberration`
    - Viz: `scale 0. 1. 0. 0.1` (UV offset) -> Send to `tv_param_aberration`
- **Ghosting**:
    - Audio: `scale 0. 1. 0. 0.95` (Feedback amount) -> Send to `tv_audio_ghosting`
    - Viz: `scale 0. 1. 0. 0.9` (Feedback blend) -> Send to `tv_param_ghosting`

## 3. Audio Implementation (`code/tv.effects.gendsp`)

Create a new Gen~ file.

**Inputs:**
- `in1`, `in2`: Stereo Audio
- `mosaic`, `solarize`, `aberration`, `ghosting`: Parameters

**Processing Chain:**

1.  **Solarize (Distortion)**:
    -   Algorithm: Foldover.
    -   Code: `out = fold(in * (1 + solarize * 5), -1, 1)` (Gain up then fold).

2.  **Aberration (Multiband Delay)**:
    -   Algorithm: 3-band crossover using `svf`.
    -   Low (<200Hz): No delay.
    -   Mid (200-2k): Delay L/R by `aberration * 0.5`.
    -   High (>2k): Delay L/R by `aberration`.
    -   *Note*: Gen~ `delay` requires a buffer size definition. We might need `delay` operator with a defined max size (e.g., `delay 44100`).

3.  **Ghosting (Comb/Feedback)**:
    -   Algorithm: Short feedback delay (slapback).
    -   Code: `out = in + delay(in, 15ms) * ghosting`.

4.  **Mosaic (Degrade)**:
    -   Algorithm: Sample Rate Reduction & Bit Crushing.
    -   Code:
        -   SR: `phasor` or counter to hold sample for N frames.
        -   Bit: `floor(in * bits) / bits`.

**Integration:**
-   Add `gen~ @gen tv.effects.gendsp` to `modules/tv.audio.maxpat` before the final output.

## 4. Video Implementation (`code/tv.core.genjit`)

Modify existing `tv.core.genjit`.

**New Params:**
-   `mosaic`, `solarize`, `aberration`, `ghosting`.

**Shader Logic:**

1.  **Mosaic**:
    -   Quantize UVs before sampling.
    -   `uv = floor(uv * blocks) / blocks`.

2.  **Aberration**:
    -   Sample texture 3 times with offsets for R, G, B channels.
    -   `r = sample(tex, uv + offset).r`
    -   `b = sample(tex, uv - offset).b`

3.  **Solarize**:
    -   Apply to sampled color.
    -   `color.rgb = abs(color.rgb - solarize)` (if solarize > 0).

4.  **Ghosting**:
    -   Modify the feedback loop.
    -   Currently `smear` handles feedback. `ghosting` might be a distinct "trail" effect.
    -   We can reuse the `feedback_frame` but maybe apply a different blend mode or offset for ghosting.
    -   *Decision*: Let's implement Ghosting as a "frame blend" distinct from Smear if possible, or just enhance Smear. The plan says "Previous Frame Blend". `smear` in `tv.core` is already `mix(input, feedback, smear)`.
    -   Maybe Ghosting adds a spatial offset to the feedback? Or just controls the feedback decay differently?
    -   Let's implement it as a "Double Vision" effect: mix current frame with a *delayed* frame? Genjit `History` is only 1 frame.
    -   Alternative: Ghosting = "Interlacing" effect? The plan says "Previous Frame Blend (Interlacing)".
    -   Let's stick to the plan: "Mix current frame with a frame buffered 2-3 frames ago". This is hard in single-buffer Gen.
    -   *Compromise*: Ghosting will be implemented as "Smear with spatial offset" (Motion Blur) or just mapped to the existing `smear` parameter if it's redundant.
    -   Actually, the plan says "Ghosting" -> "Convolution".
    -   Let's implement Ghosting as **Interlacing/Scanlines** in Video to differentiate from Smear.
    -   *Wait*, the plan says: "The 'ghost' of the previous signal overlays the current one."
    -   Let's implement it as a simple **Feedback Decay** (which `smear` is) but maybe we rename `smear` to `ghosting` or use `ghosting` to control the *feedback amount* and `smear` to control the *blur*?
    -   Let's look at `tv.core` again. `smear` mixes input and feedback.
    -   Let's add `ghosting` as a parameter that *modulates* the feedback UVs (e.g. zooms the feedback out slightly to create trails).

## 5. Todos

1.  [ ] Create `code/tv.effects.gendsp` with the 4 audio effects.
2.  [ ] Update `modules/tv.audio.maxpat` to include `tv.effects.gendsp`.
3.  [ ] Update `code/tv.core.genjit` with the 4 video effects.
4.  [ ] Update `modules/tv.param.maxpat` to route the new parameters.
