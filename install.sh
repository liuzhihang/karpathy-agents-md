#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf '%s\n'     'Install into the current project directory. Existing files are not overwritten.'     '安装到当前项目目录，不覆盖已有文件。'     'Usage: bash install.sh [--lang en|zh-CN] [--type agents|skill] [--agent codex|claude-code]'     'Run without flags for the interactive menu.'
}

lang='' type='' agent=''
while (( $# )); do
  case "$1" in
    -h|--help) usage; exit 0 ;;
    --lang|--type|--agent)
      if (( $# < 2 )) || [[ "$2" == -* || -z "$2" ]]; then usage >&2; exit 2; fi
      case "$1" in
        --lang) lang=$2 ;;
        --type) type=$2 ;;
        --agent) agent=$2 ;;
      esac
      shift 2 ;;
    *) usage >&2; exit 2 ;;
  esac
done

case "$lang" in ''|en|zh-CN) ;; *) usage >&2; exit 2 ;; esac
case "$type" in ''|agents|skill) ;; *) usage >&2; exit 2 ;; esac
case "$agent" in ''|codex|claude-code) ;; *) usage >&2; exit 2 ;; esac

say() {
  if [[ "$lang" == 'zh-CN' ]]; then printf '%s\n' "$2"; else printf '%s\n' "$1"; fi
}
choose() {
  printf '%s\n' "$1" >&2
  if ! IFS= read -r answer; then
    printf '%s\n' 'Cancelled. Nothing installed. / 已取消，未安装。' >&2
    exit 1
  fi
}
if [[ -z "$lang" ]]; then
  choose 'Language / 安装语言: 1) English [default]  2) 简体中文'
  case "$answer" in ''|1) lang=en ;; 2) lang=zh-CN ;; *) usage >&2; exit 2 ;; esac
fi
if [[ -z "$type" ]]; then
  choose "$(say 'Install: 1) AGENTS.md  2) Skill' '安装目标：1) AGENTS.md  2) Skill')"
  case "$answer" in 1) type=agents ;; 2) type=skill ;; *) usage >&2; exit 2 ;; esac
fi
if [[ -z "$agent" ]]; then
  choose "$(say 'Client: 1) Codex  2) Claude Code' '客户端：1) Codex  2) Claude Code')"
  case "$answer" in 1) agent=codex ;; 2) agent=claude-code ;; *) usage >&2; exit 2 ;; esac
fi

source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
project=$(pwd -P)
if [[ "$project" == "/" || "$project" -ef "${HOME:-}" ]]; then
  say 'Run this from a project directory, not your home directory or /.' '请在项目目录运行，不要在家目录或 / 下运行。' >&2
  exit 1
fi
git_root=$(git -C "$project" rev-parse --show-toplevel 2>/dev/null || true)
if [[ -n "$git_root" && "$git_root" != "$project" ]]; then
  say "Run this from the Git project root: $git_root" "请在 Git 项目根目录运行：$git_root" >&2
  exit 1
fi
exists() { [[ -e "$1" || -L "$1" ]]; }

if [[ "$type" == agents ]]; then
  src="$source_dir/$lang/AGENTS.md"
  dest="$project/AGENTS.md"
  if exists "$dest" || exists "$project/AGENTS.override.md"; then
    say 'An AGENTS.md or AGENTS.override.md already exists. Nothing changed. Use Prompt installation to review and merge it.' '已有 AGENTS.md 或 AGENTS.override.md，未修改。请用 Prompt 安装检查并合并。' >&2
    exit 1
  fi
else
  if [[ "$agent" == codex ]]; then client_dir='.agents'; else client_dir='.claude'; fi
  name='karpathy-coding-guidelines'
  root="$project/$client_dir/skills"
  if [[ -L "$project/$client_dir" || -L "$root" ]]; then
    say 'The skill destination is symlinked. Nothing changed.' 'Skill 的目标路径含符号链接，未修改。' >&2
    exit 1
  fi
  if exists "$root/$name" || exists "$root/$name-zh-cn"; then
    say 'This skill or its older Chinese installation already exists. Nothing changed. Review it before switching the language.' '已安装此 Skill 或旧版中文 Skill，未修改。切换语言前请先对比。' >&2
    exit 1
  fi
  src="$source_dir/skills/$lang/$name/SKILL.md"
  dest="$root/$name/SKILL.md"
fi

if [[ ! -s "$src" ]]; then
  say 'Template missing. Extract the complete release package before running this script.' '找不到模板。请先解压完整安装包，再运行脚本。' >&2
  exit 1
fi
if [[ "$type" == skill ]]; then
  mkdir -p -- "$root"
  mkdir -- "$root/$name"
fi
( set -C; cat -- "$src" > "$dest" )
cmp -s -- "$src" "$dest"
say "Installed: $dest" "已安装：$dest"
if [[ "$type" == agents && "$agent" == claude-code ]]; then
  say 'Check /memory. If this client does not load AGENTS.md directly, review an @AGENTS.md import in your project CLAUDE.md. This script did not edit CLAUDE.md.' '请用 /memory 核对。若客户端未直接加载 AGENTS.md，请检查是否要在项目 CLAUDE.md 中加入 @AGENTS.md；脚本未修改 CLAUDE.md。'
else
  say 'Verify discovery in the client before relying on these instructions.' '请在客户端核对是否已加载，再使用这些规则。'
fi
