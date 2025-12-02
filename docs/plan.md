# Modularization Strategy: Teevee v7 (Twin Engine / Parallel)

This document defines the implementation roadmap for the v7 "Twin Engine" architecture. See [architecture.md](architecture.md) for the full design specification.

## Core Concept

**v7 abandons the "Audio-inside-Video" approach.** Instead of encoding audio into matrices, processing on GPU, and decoding back (which causes artifacts), we run two **parallel** processing chains:

- **Path A: Hi-Def Audio Engine (MSP)** — The "Truth" — actual audio processing
- **Path B: Video Engine (Jitter)** — The "Metaphor" — visualization only

Both paths are driven by the same control parameters, creating a "what you see is what you hear" experience without audio degradation.

-----

## 1. Directory Structure

```text
Teevee_Project/
├── teevee.amxd             (The Shell: Host device, parameters, and routing)
├── modules/
│   ├── tv.main.maxpat      (The Router: Connects both engines)
│   ├── tv.audio.maxpat     (PATH A: MSP audio engine - NEW)
│   ├── tv.sync.maxpat      (The Clock: Master timing)
│   ├── tv.ingest.maxpat    (PATH B: Audio features → Viz matrix)
│   ├── tv.fx.maxpat        (PATH B: GPU shader host)
│   ├── tv.viz.maxpat       (PATH B: Display)
│   ├── tv.param.maxpat     (The Hub: Dual-path parameter distribution)
│   └── tv.egress.maxpat    (DEPRECATED - kept for reference)
└── code/
    ├── tv.audio.gendsp     (Audio DSP: varispeed, freqshift - NEW)
    ├── tv.encode.gendsp    (Viz only: L/R → features for display)
    └── tv.core.genjit      (Video Gen: Scroll, Warp, Smear, Edge)
```

-----

## 2. The Synesthetic Map (Parameter Mappings)

This map defines how controls affect both engines simultaneously:

| Parameter | Visual Effect (GPU) | Audio Effect (MSP) | The Shared Experience |
|:----------|:--------------------|:-------------------|:----------------------|
| **SCROLL** | Vertical Pan (Y-Axis Offset) | Delay Line (Time Offset) | Pushing content into the "past" |
| **ZOOM** | UV Scaling (Stretch/Squash) | Varispeed / Pitch (Repitch) | Stretching the medium |
| **ROTATE** | 2D Rotation (Twist) | Frequency Shift (Spectrum Shift) | Displacing from center |
| **SMEAR** | Frame Feedback (Blur) | Reverb / Feedback (Decay) | Signal refusing to die |
| **FREEZE** | Pixel Sorting / Bloom | Buffer Loop (Gating) | Time stops |

-----

## 3. The Modules

### A. `tv.audio.maxpat` (NEW - The Hi-Def Audio Engine)

**Purpose:** Process audio in pure MSP domain for artifact-free output.

* **Inlets:**
    * 1: `signal` (Audio Left)
    * 2: `signal` (Audio Right)
* **Outlets:**
    * 1: `signal` (Processed Audio Left)
    * 2: `signal` (Processed Audio Right)
* **Internal Components:**
    * **Ring Buffer:** `buffer~ tv_audio_ring 65536 2` (~1.5s stereo history)
    * **Writer:** `poke~` writes audio circularly
    * **Reader:** `groove~` or `phasor~` → `index~` for varispeed playback
    * **Frequency Shifter:** `freqshift~` for rotation effect
    * **Reverb:** `cverb~` or FDN for smear effect
* **Parameters (via receive):**
    * `r ---tv_audio_scroll` → Delay time offset
    * `r ---tv_audio_zoom` → Playback speed (pitch)
    * `r ---tv_audio_rotate` → Frequency shift amount
    * `r ---tv_audio_smear` → Reverb wet/dry

### B. `tv.main.maxpat` (Updated - The Twin Engine Router)

**Purpose:** Routes audio through Path A and visual data through Path B.

* **Signal Flow:**
    ```
    plugin~ → [SPLIT] → tv.audio → plugout~ (Path A: Audio)
                    ↓
              tv.ingest → tv.fx → tv.viz (Path B: Visual)
    ```
* **Key Change:** Audio output comes from `tv.audio`, NOT from matrix readback.

### C. `tv.ingest.maxpat` (Updated - Visualization Writer)

**Purpose:** Writes audio *features* to matrix for visualization ONLY.

* **Inlets:** Audio L, Audio R, Write Index
* **Outlets:** None (writes to `tv_viz_ram`)
* **Key Change:** Matrix is used for display, not audio reconstruction.
* **MS-Flux Mapping:**
    * Plane 0 (Alpha): RMS Amplitude
    * Plane 1 (Red): Mono Signal (Waveform)
    * Plane 2 (Green): Spectral Flux
    * Plane 3 (Blue): Stereo Width (Side)

### D. `tv.param.maxpat` (Updated - Dual-Path Hub)

**Purpose:** Routes parameters to BOTH audio and video engines.

* **New Sends:**
    * `s ---tv_audio_scroll` (for tv.audio)
    * `s ---tv_audio_zoom`
    * `s ---tv_audio_rotate`
    * `s ---tv_audio_smear`
    * `s ---tv_audio_freeze`
* **Existing Sends:** (for tv.fx visual processing)
    * `s ---tv_param_scroll`
    * `s ---tv_param_zoom`
    * `s ---tv_param_rotation`
    * `s ---tv_param_smear`

### E. `tv.egress.maxpat` (DEPRECATED)

**Purpose:** No longer used in v7. Kept for reference only.

* Audio now comes from `tv.audio`, not matrix readback.

-----

## 4. The External Code

### `tv.audio.gendsp` (NEW)

Audio processing in gen~ for the audio engine.

```
// Inputs
in1 = Left
in2 = Right

// Parameters
Param scroll_delay(0.5, min=0, max=1);      // Delay time (0-1 → 0-1500ms)
Param zoom_speed(1.0, min=0.25, max=4.0);   // Playback speed
Param rotate_shift(0, min=-1000, max=1000); // Frequency shift Hz
Param smear_wet(0, min=0, max=1);           // Reverb wet amount
Param freeze(0, min=0, max=1);              // Freeze toggle

// Implementation uses buffer~/groove~ in parent patch
// This gen~ handles the mixing and gating
```

### `tv.encode.gendsp` (Unchanged)

Still encodes L/R to ARGB features, but now ONLY for visualization.

### `tv.core.genjit` (Unchanged)

GPU shader for visual effects - scroll, warp, smear, edge detection.

-----

## 5. Implementation Checklist

### Phase 1: Audio Engine ✅
- [x] Create `tv.audio.maxpat` with buffer~/poke~/index~ rig
- [x] Implement delay line with scroll parameter (buffer~/poke~/index~ circular buffer)
- [x] Implement varispeed playback with zoom parameter (buffer~/phasor~/index~)
- [x] Add freqshift~ for rotation
- [x] Add tapin~/tapout~ multi-tap reverb for smear (wet/dry crossfade)
- [x] Add freeze (buffer loop) functionality

### Phase 2: Twin Engine Integration ✅
- [x] Update `tv.main.maxpat` to route audio through tv.audio
- [x] Remove audio output dependency on tv.egress
- [x] Update `tv.param.maxpat` for dual-path routing
- [x] Test audio passthrough - WORKING (zoom, rotate, scroll, smear all functional)

### Phase 3: Visualization Path ✅
- [x] Update `tv.ingest.maxpat` to write to visualization-only matrix (`---tv_viz_ram`)
- [x] Fix `tv.fx.maxpat` matrix name mismatch (reads `tv_ram`, should read `---tv_viz_ram`)
- [x] Ensure tv.fx shader parameters match audio parameters
- [x] Verify visual feedback loop works independently

### Phase 4: Polish ✅
- [x] Test all parameter ranges for audio/visual sync
- [x] Optimize CPU usage (MSP objects are efficient)
- [x] Add freeze mode with visual bloom/sort
- [x] Document parameter ranges and mappings
- [x] Deprecate tv.egress.maxpat formally

-----

## 6. Critical M4L Rules

* **Naming:** Always use `---` prefix for named objects (e.g., `---tv_audio_ring`)
* **Types:** Always use `float32` for matrices and buffers
* **Threading:** Audio engine runs in MSP scheduler, visual in low-priority

-----

## 7. Parameter Reference (v7.1)

### Input Parameter Ranges (UI Dials: 0-1)

All parameters arrive at `tv.param.maxpat` as normalized 0-1 values from the UI.

### Audio Engine Scaling (tv.audio.maxpat)

| Parameter | Input | Scaled Output | MSP Object | Notes |
|:----------|:------|:--------------|:-----------|:------|
| **Scroll** | 0-1 | 0-1000 ms | `scale~ 0. 1000. 0 44100` → delay offset | Maps to ~1 second max delay |
| **Zoom** | 0-1 | 0.5-2.0× speed | `*~ 86.` → `phasor~` | 0.5 = octave down, 2.0 = octave up |
| **Rotate** | 0-1 | -500 to +500 Hz | `freqshift~` | Bode frequency shifter |
| **Smear** | 0-1 | 0-1 wet/dry | `*~` crossfade | 0 = dry, 1 = full reverb |
| **Freeze** | 0/1 | 0/1 gate | `*~` gates input | Stops buffer writing when frozen |

### Visual Engine Scaling (tv.fx / tv.core.genjit)

| Parameter | Input | Scaled Output | Shader Param | Notes |
|:----------|:------|:--------------|:-------------|:------|
| **Scroll** | 0-1 | 0-1 | `scroll_speed` | Y-axis pan velocity |
| **Zoom** | 0-1 | 0.5-2.0 | `zoom` | UV scaling (0.25-4.0 supported) |
| **Rotate** | 0-1 | -π to +π rad | `rotation` | 2D rotation in radians |
| **Smear** | 0-1 | 0-0.95 | `smear` | Frame feedback (capped to prevent infinite) |
| **Edge** | 0-1 | 0-1 | `edge_amount` | Sobel edge detection mix |
| **Warp X/Y** | 0-1 | -1 to +1 | `warp_x`, `warp_y` | Barrel/pincushion distortion |

### Freeze Behavior

**Audio (tv.audio.maxpat):**
- Freeze = 1: Input signal is gated (`*~ 0`), buffer stops recording
- Delay buffer continues looping existing content
- All other processing (zoom, rotate, smear) still applies

**Visual (tv.core.genjit):**
- Freeze stops matrix updates in tv.ingest
- Existing frame continues to be processed with feedback effects

-----

