# Teevee

Teevee is an audio effect for Max for Live inspired by video processing techniques. It transforms sound using time and spectral manipulations analogous to video effects, producing rich, evolving textures.

## The Effect

Audio passes through a chain of time and spectral manipulation:

- **Scroll** — Delay line pushing audio into the past
- **Zoom** — Varispeed pitch shifting
- **Rotate** — Bode frequency shifting and spectrum displacement
- **Smear** — Multi-tap reverb / feedback wash
- **Freeze** — Trap the current moment in a loop
- **Scrub** - Tape slip effect

The audio engine runs in 64-bit MSP for artifact-free processing. The video engine runs on GPU for smooth visuals without interfering with audio.

## Architecture

See [docs/architecture.md](docs/architecture.md) for full technical details.
