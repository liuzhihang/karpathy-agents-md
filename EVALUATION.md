# How to evaluate the guidelines

[简体中文](EVALUATION.zh-CN.md)

Separate two questions: did the client load the guidance, and did that guidance improve the outcome? A successful install proves placement, not an improvement in coding quality.

## 1. Verify discovery

Use a disposable project and record the client, version, model, and installed language. Start each run in a fresh session from the same project snapshot. Preserve existing project rules, but isolate personal global rules, overlapping skills, and conversation history. Check which files the client actually discovered. Mark unverified discovery as such.

## 2. Compare the same tasks

Run four conditions: no guidance from this project, AGENTS.md only, Skill only, and both. Invoke the Skill explicitly in the main comparison to measure what happens when it is used. Use one language per run. Separately run a few tasks without explicit invocation to measure appropriate automatic use and false triggers on trivial tasks.

Keep snapshots, prompts, clients, model versions, permissions, tools, and budgets fixed. Reset between runs and shuffle their order. Start with six tasks and two repeats for each condition, for 48 runs total, to test the cases and rubric. Expand the task set before publishing conclusions. Report Codex and Claude Code separately; compare languages in a separate experiment without changing the client.

## 3. Score the results

- **Primary metric: acceptance pass rate.** Define independent checks and acceptance criteria up front. Do not let the agent's own tests determine the score. Exercise the real entry point and review judgment calls separately.
- **Secondary metrics:** unrelated edits, regressions, unauthorized writes, unnecessary questions, unsupported pass claims, elapsed time, and tokens. Show human reviewers anonymized diffs and logs without the condition labels.
- **Task types:** a typo, a reproducible bug, a domain-boundary change, a compatibility ambiguity, a cross-module regression, and a read-only review. Score a justified clarification and pause differently from an implementation, according to what the task requires.

Report raw counts, pass rates, and paired percentage-point differences versus the baseline. Disclose run-to-run variability and treat a small pilot as preliminary. Recommend both formats together only if they beat a single format without adding material friction. Installation success does not substitute for these results.
