# Godot Scripting Notes

Last verified: 2026-03-28

## GDScript

- 4.5 added variadic arguments (`...`) and `@abstract`.
- Release builds now support script backtracing, which improves production debugging.
- For this repository, keep GDScript strongly typed and prefer composition over abstract inheritance unless an interface contract clearly pays for itself.

## C# / Mono

- Godot's maintained C# packages moved from .NET 6 to .NET 8.
- This project uses the 4.6.1 Mono build, so future C# modules should target current .NET SDK expectations rather than older community examples.
