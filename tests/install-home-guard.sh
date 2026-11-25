#!/usr/bin/env bash
set -euo pipefail

repo=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)
tmp=$(mktemp -d)
trap 'rm -rf -- "$tmp"' EXIT
mkdir "$tmp/home" "$tmp/home/project"
ln -s "$tmp/home" "$tmp/linked-home"

for home in "$tmp/home" "$tmp/linked-home"; do
  for target in agents skill; do
    rc=0
    output=$(cd "$home" && HOME="$home" bash "$repo/install.sh" --lang en --type "$target" --agent claude-code 2>&1) || rc=$?
    if [[ "$rc" != 1 || "$output" != *"not your home directory"* ]]; then
      printf 'Expected the home-directory guard to refuse %s (%s), got status %s: %s\n' "$home" "$target" "$rc" "$output" >&2
      exit 1
    fi
  done
done

[[ ! -e "$tmp/home/AGENTS.md" && ! -e "$tmp/home/.claude" ]]
(
  cd "$tmp/linked-home/project"
  HOME="$tmp/linked-home" bash "$repo/install.sh" --lang en --type skill --agent claude-code
)
cmp "$repo/skills/en/karpathy-guidelines/SKILL.md" "$tmp/home/project/.claude/skills/karpathy-guidelines/SKILL.md"
printf '%s\n' 'Home-directory guard checks passed.'
