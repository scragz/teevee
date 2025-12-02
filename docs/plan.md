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
- [ ] Add freeze (buffer loop) functionality - deferred

### Phase 2: Twin Engine Integration ✅
- [x] Update `tv.main.maxpat` to route audio through tv.audio
- [x] Remove audio output dependency on tv.egress
- [x] Update `tv.param.maxpat` for dual-path routing
- [x] Test audio passthrough - WORKING (zoom, rotate, scroll, smear all functional)

### Phase 3: Visualization Path
- [x] Update `tv.ingest.maxpat` to write to visualization-only matrix (`---tv_viz_ram`)
- [ ] Fix `tv.fx.maxpat` matrix name mismatch (reads `tv_ram`, should read `---tv_viz_ram`)
- [ ] Ensure tv.fx shader parameters match audio parameters
- [ ] Verify visual feedback loop works independently

### Phase 4: Polish
- [ ] Test all parameter ranges for audio/visual sync
- [ ] Optimize CPU usage (MSP objects are efficient)
- [ ] Add freeze mode with visual bloom/sort
- [ ] Document parameter ranges and mappings
- [ ] Deprecate tv.egress.maxpat formally

-----

## 6. Critical M4L Rules (Unchanged)

* **Naming:** Always use `---` prefix for named objects (e.g., `---tv_audio_ring`)
* **Types:** Always use `float32` for matrices and buffers
* **Threading:** Audio engine runs in MSP scheduler, visual in low-priority

-----

## 7. M4L Object Compatibility (IMPORTANT)

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

## 8. Advantages of v7 Architecture

1. **Audio Quality:** 100% MSP 64-bit float. No interpolation noise from video processing.
2. **Safety:** GPU crashes do not kill the audio stream.
3. **Flexibility:** Visual effects can be exaggerated without destroying audio.
4. **M4L Stability:** Removes the complex "matrix-to-signal" dependency.
5. **CPU Efficiency:** Standard MSP objects are more efficient than jit.peek~/poke~ round-trips.

-----

## 9. Current tv.audio.maxpat Architecture

The working audio engine uses a 4-stage serial processing chain:

```
Input L/R
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 1: DELAY (SCROLL)                                 │
│ buffer~ ---tv_delay_l/r → poke~ (write)                 │
│ phasor~ 0.5 → scale~ → write index                      │
│ write_idx - scroll_offset → %~ 88200 → index~ (read)    │
│ Scroll param (0-1000ms) controls delay offset           │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 2: VARISPEED (ZOOM)                               │
│ buffer~ ---tv_pitch_l/r → poke~ (write at fixed rate)   │
│ phasor~ 86 → scale~ → write index                       │
│ zoom * 86 → phasor~ → scale~ → index~ (read)            │
│ Zoom param (0.5-2.0) controls playback speed/pitch      │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 3: FREQ SHIFT (ROTATE)                            │
│ freqshift~ with shift amount from rotate param          │
│ Rotate param (-500 to +500 Hz) controls shift           │
└─────────────────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────────────────┐
│ STAGE 4: REVERB (SMEAR)                                 │
│ tapin~ 1000 → tapout~ 29 67 / 37 79 → *~ 0.4 (feedback) │
│ Dry/wet crossfade: dry * (1-smear) + wet * smear        │
│ Smear param (0-1) controls wet/dry mix                  │
└─────────────────────────────────────────────────────────┘
    ↓
Output L/R
```

### Parameter Receives
- `r ---tv_audio_scroll` → delay offset (0-1000ms)
- `r ---tv_audio_zoom` → playback speed (0.5-2.0)
- `r ---tv_audio_rotate` → freq shift (-500 to +500 Hz)
- `r ---tv_audio_smear` → reverb wet/dry (0-1)
- `r ---tv_audio_freeze` → (not yet implemented)
