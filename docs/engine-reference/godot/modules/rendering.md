# Godot Rendering Notes

Last verified: 2026-03-28

- The default glow screen blend mode changed from additive to softlight.
- `EnvironmentGlowBlendMode.SOFTLIGHT` now behaves the same with or without `use_hdr_2d`.
- Keep post-processing extremely light in this project so dark ink strokes stay readable against a pale notebook background.
