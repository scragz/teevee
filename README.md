# Teevee

A **synesthetic audio-visual effect** for Max for Live.

Teevee runs parallel audio and video processing chains driven by unified controls. What you see is what you hear — each parameter produces mechanically isomorphic effects in both domains.

## The Effect

Audio passes through a chain of time and spectral manipulation:

- **Scroll** — Delay line pushing audio into the past
- **Zoom** — Varispeed pitch shifting (slow down / speed up)
- **Rotate** — Bode frequency shifting (spectrum displacement)
- **Smear** — Multi-tap reverb / feedback wash
- **Freeze** — Trap the current moment in a loop

Meanwhile, a reactive visualization displays the same transformations as video metaphors:

- **Scroll** → Vertical pan
- **Zoom** → UV scaling
- **Rotate** → 2D rotation
- **Smear** → Frame feedback blur
- **Freeze** → Static frame decay

The audio engine runs in 64-bit MSP for artifact-free processing. The video engine runs on GPU for smooth visuals. They never interfere with each other.

## Architecture

See [docs/architecture.md](docs/architecture.md) for full technical details.

```
Audio Input
    ↓
┌───────────┐     ┌───────────┐
│ Path A:   │     │ Path B:   │
│ MSP Audio │     │ Jitter    │
│ Engine    │     │ Video     │
└─────┬─────┘     └─────┬─────┘
      ↓                 ↓
 Audio Output      Visual Display
```

Both paths receive the same control parameters, creating synchronized audio-visual transformations.
