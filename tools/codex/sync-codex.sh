#!/usr/bin/env bash
set -euo pipefail

install_user_skills=0
if [[ "${1:-}" == "--install-user-skills" ]]; then
  install_user_skills=1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/../.." && pwd)"
source_skills="${repo_root}/.claude/skills"
plugin_skills="${repo_root}/plugins/codex-game-studios/skills"

if [[ ! -d "${source_skills}" ]]; then
  echo "Source skills directory not found: ${source_skills}" >&2
  exit 1
fi

rm -rf "${plugin_skills}"
mkdir -p "${plugin_skills}"
cp -R "${source_skills}/." "${plugin_skills}/"
plugin_count="$(find "${plugin_skills}" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
echo "Synced ${plugin_count} skills into repo plugin at ${plugin_skills}"

if [[ "${install_user_skills}" -eq 1 ]]; then
  codex_home="${CODEX_HOME:-${HOME}/.codex}"
  user_skills="${codex_home}/skills"
  mkdir -p "${user_skills}"

  for skill_dir in "${source_skills}"/*; do
    [[ -d "${skill_dir}" ]] || continue
    skill_name="$(basename "${skill_dir}")"
    rm -rf "${user_skills}/${skill_name}"
    cp -R "${skill_dir}" "${user_skills}/${skill_name}"
  done

  echo "Installed skills into user Codex directory at ${user_skills}"
fi

echo "Restart Codex to refresh skill discovery if commands do not appear immediately."
