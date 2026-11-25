# Karpathy-Inspired Coding Guidelines

Use with project rules. Scale the process to the risk.

## 1. Think Before Coding

- Read the relevant rules, code, and tests. Define the goal and acceptance criteria.
- State the assumptions and trade-offs that matter. Use reversible assumptions for low-risk details.
- Ask when an unresolved decision changes correctness, scope, compatibility, or authorization. Continue independent work.

## 2. Simplicity First

- Build the smallest working end-to-end path. Avoid unrequested features and speculative abstractions.
- Check built-in capabilities, existing code, and dependencies before adding more. For unfamiliar, consequential designs, compare proven approaches.
- Respect domain boundaries, layers, and dependency direction. Preserve safety, reliability, and testability. Give temporary solutions an exit condition.

## 3. Surgical Changes

- Preserve existing edits, public contracts, and behavior outside scope. Follow project style.
- Remove only debris from your changes. Report unrelated problems without fixing them.
- Keep explanations, reviews, and investigations read-only. Ask before actions outside existing authorization, including publishing, spending, or hard-to-reverse operations.

## 4. Goal-Driven Execution

- Define what would pass or fail. Before a fix, reproduce the problem or find evidence of its cause.
- Run required project checks and verify the actual behavior against acceptance criteria. Broaden checks when changes cross boundaries.
- Report what changed, what passed, and what remains unverified. Use a diagram or interactive demo only when it clarifies the result. A demo does not replace verification.
