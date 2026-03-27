# CodeX Game Studios -- Codex Setup

This fork keeps the original Claude command names but adds Codex-native entry
points so the same workflows can be used from Codex.

In this repository, `Codex` means support for both CodeX and `Codex CLI`.
When a step is specific to the terminal client, the docs say `Codex CLI`
explicitly.

## What Was Added

- `AGENTS.md` as the Codex project entrypoint
- A repo-local Codex plugin at `plugins/codex-game-studios/`
- A marketplace entry at `.agents/plugins/marketplace.json`
- Sync scripts that mirror `.claude/skills/` into Codex-facing locations

## Source Of Truth

The authoritative skill definitions still live in `.claude/skills/`.

When you change any skill there, refresh the Codex mirror:

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\codex\sync-codex.ps1
```

or:

```bash
bash ./tools/codex/sync-codex.sh
```

## Install Into User Codex Skills

If you want the commands to be available from your personal `Codex CLI` skill
directory as well, run:

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\codex\sync-codex.ps1 -InstallUserSkills
```

or:

```bash
bash ./tools/codex/sync-codex.sh --install-user-skills
```

This copies every skill folder into `$CODEX_HOME/skills` or `~/.codex/skills`
when `CODEX_HOME` is not set.

## Using The Commands

After syncing, restart `Codex CLI` or your Codex-compatible client if the
command list does not refresh immediately.

The slash commands stay unchanged:

- `/start`
- `/brainstorm`
- `/setup-engine`
- `/design-review`
- `/sprint-plan`
- `/team-combat`
- `/team-ui`
- `/release-checklist`

## Notes

- `CLAUDE.md` is still kept for Claude compatibility.
- `.claude/settings.json` and Claude hooks remain in the repo for Claude users.
- Codex-compatible clients use `AGENTS.md` plus the plugin/user skill mirror
  instead of `claude`-specific settings.
