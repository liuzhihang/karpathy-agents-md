# Karpathy Agents.md

English · [简体中文](README.zh-CN.md)

Concise AI coding guidelines distilled from two posts by Andrej Karpathy, building on the approach of Multica's Karpathy Guidelines. Available as `AGENTS.md` or an Agent Skill, in English and Simplified Chinese.

`AGENTS.md` is the short baseline. A Skill is the on-demand workflow, with examples that turn requests into verifiable outcomes. Start with one format and one language.

- **Choose AGENTS.md** for a new team project or rules that should apply to every coding task.
- **Choose the Skill** if the project already has good rules, or if you want the workflow only for non-trivial changes and reviews. Run it explicitly when testing it.

We do not recommend installing both by default. See the [evaluation plan](EVALUATION.md). We have checked installation; we have not measured an improvement in coding outcomes.

- **English:** [AGENTS.md](en/AGENTS.md) · [Skill](skills/en/karpathy-coding-guidelines/SKILL.md)
- **简体中文:** [AGENTS.md](zh-CN/AGENTS.md) · [Skill](skills/zh-CN/karpathy-coding-guidelines/SKILL.md)

## Install with a prompt

Open your target project in Codex or Claude Code and paste the prompt below. Make the extracted package available to the agent first, or give it an accessible repository or release link when asked. No edits to the prompt are needed.

```text
Install Karpathy Agents.md into this project.

Before editing, ask me in one message for any choices not already clear:
1. Install AGENTS.md or Skill?
2. Target Codex or Claude Code? Skip this question only if the client is known.
3. Use English (default) or Simplified Chinese?

Use the Karpathy Agents.md package I have provided, or get the templates from https://github.com/liuzhihang/karpathy-agents-md. If they are unavailable, ask for a checkout or extracted package path. Read the selected template and applicable project rules before editing. Install into the project root, not my home directory.

For AGENTS.md: create it if absent, or merge only missing guidance. Preserve project commands, conventions, and existing edits. Ask before resolving a material conflict. If a Codex AGENTS.override.md is active, report it rather than assuming the base file will load. For Claude Code, account for existing CLAUDE.md instructions and client version; if an import would be needed, show the proposed change before editing CLAUDE.md.

For Skill: select the source from skills/en/karpathy-coding-guidelines/ or skills/zh-CN/karpathy-coding-guidelines/. Both install as karpathy-coding-guidelines under .agents/skills/ for Codex or .claude/skills/ for Claude Code. Check for the installed name and any older language-suffixed copy. Compare and ask before replacing or migrating; do not install both.

Do not change global configuration, install both variants, commit, or push. Report the changed paths and what you verified. If active discovery is unverified, say so and tell me how to check.
```

## Install with a command

Clone this repository or download and extract its source ZIP. From the target project root, run:

```bash
bash "/path/to/karpathy-agents-md/install.sh"
```

The menu asks for language, format, and client. It defaults to English if you press Enter at the language menu. To skip all menus, pass all three options:

```bash
bash "/path/to/karpathy-agents-md/install.sh" --lang zh-CN --type skill --agent codex
```

- Languages: `en`, `zh-CN`. Formats: `agents`, `skill`. Clients: `codex`, `claude-code`.
- The script installs local files only. It does not fetch code, edit global settings, or overwrite an existing `AGENTS.md`, override, or Skill. Both languages install as `karpathy-coding-guidelines`. To switch languages, use the prompt to compare the installed copy and review the replacement.
- **Codex:** See [instruction discovery](https://learn.chatgpt.com/docs/agent-configuration/agents-md) and [Skill locations](https://learn.chatgpt.com/docs/build-skills).
- **Claude Code:** Direct `AGENTS.md` loading requires v2.1.277 or later and depends on project instructions. Use `/memory` to check on supported versions. If the file isn't loaded, an existing project `CLAUDE.md` can import it with `@AGENTS.md`. The script leaves `CLAUDE.md` untouched. See [Claude Code instructions](https://code.claude.com/docs/en/memory#agentsmd) and [Skills](https://code.claude.com/docs/en/skills).

## Credits

- [Andrej Karpathy on coding with Claude](https://x.com/karpathy/status/2015883857489522876): surface assumptions, keep changes small, and give agents verifiable outcomes.
- [Andrej Karpathy on understanding model output](https://x.com/karpathy/status/2105819303471976479): choose the clearest format for the evidence.
- [Multica's Karpathy Guidelines](https://github.com/multica-ai/andrej-karpathy-skills/blob/main/skills/karpathy-guidelines/SKILL.md): the four-principle structure and the short, example-driven format.

Independently maintained. Not an official project of Andrej Karpathy or Multica.
