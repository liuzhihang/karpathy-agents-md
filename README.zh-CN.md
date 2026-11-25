# Karpathy Agents.md

[English](README.md) · 简体中文

从 Andrej Karpathy 的两条推文提炼的 AI 编码准则，沿用 Multica Karpathy Guidelines 的结构。提供英文和简体中文，支持 `AGENTS.md` 与 Skill 两种用法。

`AGENTS.md` 是简短的常驻准则。Skill 是按需使用的工作流，用例子把任务改写成可验证的结果。初次使用，选一种形式和一种语言就够了。

- **选 AGENTS.md：**新项目、团队统一准则，或者希望每次编码都遵循这些约束。
- **选 Skill：**项目已有成熟规则，或者希望只在复杂改动、审阅和验证时按需启用。评测时可显式调用。

不建议默认双装。见[评测方案](EVALUATION.zh-CN.md)。目前已验证安装，还没有测出编码效果提升多少。

- **English：**[AGENTS.md](en/AGENTS.md) · [Skill](skills/en/karpathy-coding-guidelines/SKILL.md)
- **简体中文：**[AGENTS.md](zh-CN/AGENTS.md) · [Skill](skills/zh-CN/karpathy-coding-guidelines/SKILL.md)

## 用 Prompt 安装

在 Codex 或 Claude Code 中打开目标项目，粘贴下面这段。先让 Agent 能读取解压后的安装包，或在它询问时提供可访问的仓库或发布链接。无需提前修改提示词。

```text
把 Karpathy Agents.md 安装到当前项目。

修改前，把还不确定的选项集中问我：
1. 安装 AGENTS.md 还是 Skill？
2. 用 Codex 还是 Claude Code？只有能确定当前客户端时才跳过。
3. 用 English（默认）还是简体中文？

使用我提供的安装包，或从 https://github.com/liuzhihang/karpathy-agents-md 获取模板。如果无法读取，问我要仓库检出路径或解压路径。先读所选模板和适用的项目规则。只安装到项目根目录，不写入我的家目录。

如果装 AGENTS.md：没有就创建；已有就只合并缺失的规则，保留项目命令、约定和既有改动。遇到实质冲突先问我。如果 Codex 有生效的 AGENTS.override.md，说明情况，不假定基础文件会加载。对于 Claude Code，结合现有 CLAUDE.md 和客户端版本判断；如果需要补充导入，先给我看改动，再修改 CLAUDE.md。

如果装 Skill：从 skills/en/karpathy-coding-guidelines/ 或 skills/zh-CN/karpathy-coding-guidelines/ 选一个源目录。无论语言，安装后的名称都叫 karpathy-coding-guidelines。Codex 放在 .agents/skills/，Claude Code 放在 .claude/skills/。检查是否已有同名 Skill 或旧版带语言后缀的副本。替换或迁移前先对比并询问，不并排安装。

不改全局配置，不同时安装两个语言版本，不提交、不推送。说明改动路径和实际验证结果；如果还没确认客户端发现了规则，直说，并告诉我怎么检查。
```

## 用命令安装

克隆本仓库，或下载并解压源码 ZIP，再到目标项目根目录运行：

```bash
bash "/path/to/karpathy-agents-md/install.sh"
```

菜单依次询问语言、安装目标和客户端。语言菜单直接回车选英文。三个参数都提供时，跳过菜单：

```bash
bash "/path/to/karpathy-agents-md/install.sh" --lang zh-CN --type skill --agent codex
```

- 语言：`en`、`zh-CN`。目标：`agents`、`skill`。客户端：`codex`、`claude-code`。
- 脚本只安装本地文件，不联网下载、不改全局配置，不覆盖已有 `AGENTS.md`、覆盖文件或已有 Skill。中英文安装后都叫 `karpathy-coding-guidelines`。切换语言时，用上面的 Prompt 对比已安装版本，确认后再替换。
- **Codex：**参考[规则发现机制](https://learn.chatgpt.com/docs/agent-configuration/agents-md)和 [Skill 存放位置](https://learn.chatgpt.com/docs/build-skills)。
- **Claude Code：**直接加载 `AGENTS.md` 至少需要 v2.1.277，也取决于项目指令配置。支持的版本可用 `/memory` 核对。如果文件未加载，可以在项目 `CLAUDE.md` 中用 `@AGENTS.md` 导入。脚本不会改 `CLAUDE.md`。参考 [Claude Code 规则说明](https://code.claude.com/docs/en/memory#agentsmd)与 [Skills](https://code.claude.com/docs/en/skills)。

## 致谢

- [Andrej Karpathy：用 Claude 编码的观察](https://x.com/karpathy/status/2015883857489522876)：说清假设、控制改动、给出可以验证的目标。
- [Andrej Karpathy：如何看懂模型输出](https://x.com/karpathy/status/2105819303471976479)：选择最容易读懂证据的表达形式。
- [Multica 的 Karpathy Guidelines](https://github.com/multica-ai/andrej-karpathy-skills/blob/main/skills/karpathy-guidelines/SKILL.md)：四条原则的结构，以及短句和示例的写法。

本项目独立维护，不是 Andrej Karpathy 或 Multica 的官方项目。
