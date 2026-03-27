# Technical Preferences

<!-- Populated by /setup-engine. Updated as the user makes decisions throughout development. -->
<!-- All agents reference this file for project-specific standards and conventions. -->

## Engine & Language

- **Engine**: Godot 4.6.1 Stable Mono
- **Language**: GDScript (primary), C# with .NET 8 available when needed
- **Rendering**: 2D-first renderer with notebook-paper readability prioritized over post-processing
- **Physics**: Godot 2D physics with simple collision volumes and event-driven gameplay logic

## Naming Conventions

- **Classes**: PascalCase (for example `PlayerController`)
- **Variables**: snake_case (for example `move_speed`)
- **Signals/Events**: snake_case past tense (for example `delivery_completed`)
- **Files**: snake_case matching the main class or purpose (for example `ink_trail_system.gd`)
- **Scenes/Prefabs**: PascalCase matching the root node (for example `NotebookDistrict.tscn`)
- **Constants**: UPPER_SNAKE_CASE (for example `MAX_TRAIL_POINTS`)

## Performance Budgets

- **Target Framerate**: 60 FPS on mid-range desktop hardware
- **Frame Budget**: 16.6 ms
- **Draw Calls**: Keep core gameplay scenes under 250 visible draw calls
- **Memory Ceiling**: 1.0 GB for prototype and vertical slice builds

## Testing

- **Framework**: GUT for automated tests plus Godot headless smoke runs for prototypes
- **Minimum Coverage**: [TO BE CONFIGURED]
- **Required Tests**: Balance formulas, gameplay systems, networking (if applicable)

## Forbidden Patterns

<!-- Add patterns that should never appear in this project's codebase -->
- Avoid deep node inheritance when composition is sufficient
- Avoid hardcoded absolute node paths across scene boundaries
- Avoid unreadable post-processing that undermines 2D silhouette clarity
- Avoid putting gameplay tuning values directly inside production code when they can live in Resources or config

## Allowed Libraries / Addons

<!-- Add approved third-party dependencies here -->
- GUT for Godot unit testing
- Built-in Godot SVG and audio importers
- No third-party gameplay addons approved yet

## Architecture Decisions Log

<!-- Quick reference linking to full ADRs in docs/architecture/ -->
- [No ADRs yet — use /architecture-decision to create one]
