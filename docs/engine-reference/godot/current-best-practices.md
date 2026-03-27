# Current Best Practices For Godot 4.6.1

Last verified: 2026-03-28

## General

- Treat 4.6.1 as a version-aware project. Read the migration notes before trusting older snippets from 4.3 or earlier.
- When upgrading existing projects to 4.6, use the editor's project file upgrade tooling before committing scene-file rewrites.

## GDScript

- Godot 4.5 added variadic arguments with `...`. Use them only when the call site becomes clearer than array or dictionary parameters.
- Godot 4.5 added `@abstract` support. Use it to tighten shared contracts, but avoid abstract hierarchies in prototype code where composition remains simpler.
- Script backtraces are available in release builds in 4.5+, so production crash diagnostics can preserve more context than older Godot examples imply.

## C# / Mono

- If this project uses C#, standardize on .NET 8 or newer.
- Recheck any C# wrappers around file dialogs or editor tooling because 4.6 moved several members to the base `FileDialog` type.

## 2D Rendering

- Re-tune glow intentionally on 4.6. The default blend behavior changed and can make older 2D post-processing recipes look washed out.
- Favor silhouette clarity over layered shader novelty for this project's doodle art.

## Gameplay Systems

- If pathfinding enters the project later, handle empty `AStar` or `AStarGrid` results directly rather than assuming a nearest valid fallback.
- If exact TileMap body coordinates matter, set `physics_quadrant_size = 1` instead of relying on pre-4.5 behavior.
