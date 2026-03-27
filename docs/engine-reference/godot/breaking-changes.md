# Godot 4.4 -> 4.6 Breaking Changes

Last verified: 2026-03-28

## 4.4 -> 4.5

- `JSONRPC.set_scope()` was renamed to `JSONRPC.set_method()`.
- `Node.get_rpc_config()` was renamed to `Node.get_node_rpc_config()`.
- `RenderingServer.instance_reset_physics_interpolation()` was removed.
- `RenderingServer.instance_set_interpolated()` was removed.
- `TileMapLayer.get_coords_for_body_rid()` became less exact by default because physics chunking is now on. If exact tile coordinates are critical, set `physics_quadrant_size` to `1`.
- `Image` and `PackedByteArray` round-tripping changed to preserve every 8-bit and 16-bit format exactly.

## 4.5 -> 4.6

- In C#, several `FileDialog` option properties, methods, and signals moved to the base `FileDialog` type.
- The TSCN text format no longer writes a `load_steps` line.
- Header resources now serialize earlier in the file, which can surprise tools that parse older ordering assumptions.
- The default glow screen blend mode changed from additive to softlight.
- `EnvironmentGlowBlendMode.SOFTLIGHT` now behaves the same whether `use_hdr_2d` is enabled or not.
- When an `AStar` or `AStarGrid` path starts from a disabled point, the returned path is now empty instead of silently skipping to the nearest valid point.

## Project Guidance

- Do not parse TSCN files with assumptions copied from 4.4 or 4.5 text output.
- For any 2D readability work, review the glow changes before reusing old visual tuning.
- If future tooling uses AStar or AStarGrid, explicitly handle empty-path cases.
