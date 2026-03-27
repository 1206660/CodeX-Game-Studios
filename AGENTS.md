# CodeX Game Studios -- Codex Project Entry

This repository packages the original Claude-first studio template so it can be
used from Codex without changing the slash command names.

## Entry Points

- `AGENTS.md` is the Codex project entrypoint.
- `CLAUDE.md` remains for Claude compatibility.
- `.claude/skills/` is the source of truth for all 37 slash commands.
- `plugins/codex-game-studios/skills/` is the Codex-facing mirror generated
  from `.claude/skills/`.

## Command Compatibility

The Codex-compatible command catalog keeps the original names unchanged:
`/start`, `/brainstorm`, `/setup-engine`, `/design-review`, `/sprint-plan`,
`/team-combat`, and the rest of the Claude commands.

If you update any skill under `.claude/skills/`, re-run one of:

- `powershell -ExecutionPolicy Bypass -File .\tools\codex\sync-codex.ps1`
- `bash ./tools/codex/sync-codex.sh`

Use `-InstallUserSkills` or `--install-user-skills` to also copy the skills to
the current user's Codex skill directory.

## Project References

- Technical preferences: `.claude/docs/technical-preferences.md`
- Coordination rules: `.claude/docs/coordination-rules.md`
- Coding standards: `.claude/docs/coding-standards.md`
- Context management: `.claude/docs/context-management.md`
- Workflow guide: `docs/WORKFLOW-GUIDE.md`
- Codex setup: `docs/CODEX-SETUP.md`

## Collaboration Protocol

This project follows the same protocol as the original template:

1. Question
2. Options
3. Decision
4. Draft
5. Approval

No commits without explicit user instruction.
