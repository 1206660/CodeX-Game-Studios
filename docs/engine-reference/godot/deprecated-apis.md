# Deprecated and Replaced APIs

Last verified: 2026-03-28

| Old API / Assumption | Use Instead | Notes |
|---|---|---|
| `JSONRPC.set_scope()` | `JSONRPC.set_method()` | Rename introduced in the 4.5 migration guide |
| `Node.get_rpc_config()` | `Node.get_node_rpc_config()` | Rename introduced in the 4.5 migration guide |
| `RenderingServer.instance_reset_physics_interpolation()` | Remove usage and follow current interpolation workflow | Removed in 4.5 |
| `RenderingServer.instance_set_interpolated()` | Remove usage and follow current interpolation workflow | Removed in 4.5 |
| Custom tools expecting `load_steps` in TSCN text files | Read current TSCN structure without relying on `load_steps` | 4.6 no longer writes the line |
| Code assuming derived `FileDialog` option members stay where they were | Read the current `FileDialog` base-type layout before writing C# wrappers | 4.6 moved several members to the base type |
| Pathfinding logic assuming disabled `AStar` start points still return a nearest valid route | Explicitly handle empty path results | 4.6 changed this behavior |
