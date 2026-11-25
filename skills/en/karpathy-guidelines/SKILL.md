---
name: karpathy-guidelines
description: Behavioral guidelines to reduce common LLM coding mistakes. Use for coding tasks and reviews where assumptions, scope, or verification matter. Trivial tasks usually do not need this Skill.
license: MIT
---

# Karpathy Guidelines

Behavioral guidelines to reduce common LLM coding mistakes, derived from [Andrej Karpathy's observations](https://x.com/karpathy/status/2015883857489522876) on LLM coding pitfalls.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- Read the relevant rules, code, and tests. State the goal and constraints.
- For details within scope that are easy to undo and won’t change expected behavior, state your assumption and proceed.
- If multiple interpretations matter, explain the trade-offs.
- If a simpler approach exists, say so. Push back when warranted.
- If a guess could affect behavior, scope, data, or permissions, pause that step. Say what’s unclear. Ask. Continue unaffected work.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- Handle plausible failures. Preserve security, reliability, and testability.
- Check built-in capabilities, existing code, and dependencies before adding more.
- Respect domain boundaries and dependency direction.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Preserve the user’s changes, public contracts, and behavior outside scope.
- Keep explanations, reviews, and investigations read-only unless asked to edit.
- Ask before publishing, spending, or taking hard-to-reverse action without authorization.
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove only code and artifacts made obsolete by your changes.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Verify invalid input is rejected and valid input still works"
- "Fix the bug" → "Reproduce the failure and rerun the same check after the fix"
- "Refactor X" → "Check public behavior before and after with the same tests"

For multi-step tasks, outline a short plan and a check for each step:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

For a bug, reproduce it or find evidence of the cause before editing. Add a regression test when practical.
Run required checks and verify behavior against the acceptance criteria. Without a test harness, exercise the actual entry point when possible.
Report what changed, what passed, and what remains unverified. A demo does not replace verification.
