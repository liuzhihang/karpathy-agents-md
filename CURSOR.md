# Using this repo with Cursor

This repository retains the upstream **Cursor project rule**. The fork’s bilingual installer targets Codex and Claude Code; it does not change Cursor settings.

## In this repository

1. Open the folder in Cursor.
2. The rule [`.cursor/rules/karpathy-guidelines.mdc`](.cursor/rules/karpathy-guidelines.mdc) is committed with `alwaysApply: true`, so you do not need extra installation steps.
3. In Cursor, you can confirm it under **Settings → Rules** (or the project rules UI), where `karpathy-guidelines` should appear.

## Use the same guidelines in another project

**Cursor (recommended):** Copy `.cursor/rules/karpathy-guidelines.mdc` into that project’s `.cursor/rules/` directory (create the folders if needed). Adjust or merge with existing rules as you like.

**Codex and Claude Code:** Use the project-level options in the [README](README.md). The inherited [`CLAUDE.md`](CLAUDE.md) remains available as a reference.

## Agent Skills

The revised Skill is available in [English](skills/en/karpathy-coding-guidelines/SKILL.md) and [Simplified Chinese](skills/zh-CN/karpathy-coding-guidelines/SKILL.md). The fork does not distribute a Claude Code marketplace plugin. See the [README](README.md) for supported installation options.
