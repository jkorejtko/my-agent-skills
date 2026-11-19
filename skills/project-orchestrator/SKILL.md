---
name: project-orchestrator
description: Coordinate multi-agent software project workflows using T3 Code orchestration and specialized skills. Use for comprehensive project audits, task planning, implementation coordination and verification.
---

# Project Orchestrator

## Purpose

Coordinate complex software engineering workflows using specialized skills. Delegate independent work when it benefits the task and the request or applicable instructions authorize delegation. Handle focused reviews directly.

## 1. Workspace identification

Before starting:

- Identify the workspace and repositories in the request. Use the current project as the default and include each explicitly named repository in a cross-repository review.
- Verify each repository's root, branch or working tree, and framework. Note which repository owns each finding and trace shared contracts across the affected repositories.
- Check Git status in each repository before making changes.
- Preserve all existing user changes.

## 2. Operating modes

Determine the requested mode from the user's instructions.

### Audit mode

- Read-only.
- Analyze the project using specialized skills.
- Do not modify files.
- Do not install dependencies.
- Do not run tests or builds unless explicitly authorized.

### Planning mode

- Consolidate audit findings.
- Identify dependencies between tasks.
- Create a prioritized implementation plan.
- Do not modify files.

### Execution mode

- Requires explicit user authorization.
- Execute only approved tasks.
- Delegate independent tasks when appropriate.
- Verify changes before reporting completion.

Never interpret an audit or planning request as permission to implement changes.

## 3. Available specialized skills

Use the following skills when relevant:

- `vue-architecture-review`: Vue and Nuxt architecture.
- `test-coverage-analysis`: Test infrastructure, quality and missing scenarios.
- `performance-audit`: Frontend and full-stack performance.
- `real-browser-audit`: Repeatable browser measurements and traces for specific pages and interactions, including throttled profiles.
- `legacy-refactor`: Safe incremental refactoring.
- `security-audit`: Evidence-driven frontend and full-stack security review, including API authorization, dependencies and deployment configuration.
- `ux-audit`: Review user journeys, responsive layouts, interaction states, keyboard access and UI copy.
- Other project-specific skills when available.

Do not force irrelevant skills into a workflow.

Before delegating, explicitly instruct each child agent to use its assigned skill.

If a child agent cannot access the assigned skill, report this limitation. Do not claim that the skill was used.

## 4. Orchestration

When T3 Code orchestration tools are available:

- Use native delegation for same-provider work with inherited settings when the host directs it. Before the first `delegate_task`, call `orchestrator_capabilities` and use the settings and provider the request specifies. Use `delegate_task` for cross-provider work, custom settings, separate checkouts, or when requested by name.
- Follow the running delegate's returned `next` action. Avoid polling with `task_status`, timers, or watchers. Cancel obsolete delegates with `task_cancel`.
- Run independent tasks concurrently when useful, record their IDs and purpose, and wait for the required results before consolidating.

If a requested provider or delegation method is unavailable, report the limitation and keep working on independent steps within scope. For audits without a required delegation method, proceed directly when delegation is unavailable.

## 5. Task design

Every delegated task must contain:

- A specific objective.
- The repository roots and branches or working trees in scope, including both sides of any shared interface the task reviews.
- Relevant skill name.
- Scope and boundaries.
- Expected output format.
- Explicit permission level.
- Verification requirements.

Prefer independent tasks with minimal overlap.

Avoid delegating multiple agents to modify the same files simultaneously.

## 6. Audit workflow

For a comprehensive project audit, consider these independent tasks:

1. Architecture review.
2. Test coverage analysis.
3. Performance audit.
4. Security review using `security-audit`, when relevant to the requested audit scope.
5. UX review using `ux-audit`, when the scope includes user-facing workflows.

When the scope calls for browser measurements, use `real-browser-audit` for the relevant performance scenarios. If both performance skills are in scope, keep one set of priorities and attach browser measurements as evidence.

For security review, pass the child's source-review scope and any existing execution authorization explicitly. Live endpoint testing requires its own bounded authorization; do not infer it from a general project audit. Keep confirmed findings separate from inconclusive candidates and preserve coverage gaps in consolidation.

After delegation:

- Collect all task IDs.
- Retrieve completed results.
- Report failures explicitly.
- Never silently ignore incomplete tasks.

## 7. Consolidation and prioritization

Merge agent findings into one report.

- Remove duplicate findings.
- Preserve distinct observations.
- Identify dependencies and conflicts.
- Distinguish verified facts from assumptions.
- Include file references and evidence where available.

Use priorities:

- P0: Critical, immediate action required.
- P1: High impact, address soon.
- P2: Meaningful improvement.
- P3: Minor improvement or optional cleanup.

Do not invent severity or evidence.

## 8. Implementation workflow

Only execute tasks explicitly authorized by the user.

- Break work into small, independent and reversible tasks.
- Preserve public APIs and existing behavior.
- Avoid unrelated changes.
- Do not let multiple agents edit the same files concurrently.
- Keep track of modified files.
- Review every delegated implementation result.
- Inspect Git diff after changes.
- Run relevant tests and checks only when authorized.

If implementation scope expands, stop and request approval.

## 9. Retry and failure handling

For implementation tasks:

- Allow a maximum of three attempts per task.
- A retry must address the reason for the previous failure.
- Do not repeat an identical unsuccessful attempt.
- After three unsuccessful attempts, mark the task as blocked or skipped.
- Record the failure and its cause.
- Continue with independent tasks when safe.
- Do not hide failures or report incomplete tasks as successful.

Never automatically discard changes from a failed task.

## 10. Verification

Before reporting completion:

- Check the final Git diff.
- Verify that only intended files changed.
- Review test and build results when executed.
- Distinguish executed checks from checks that were not run.
- Identify unresolved risks.
- Confirm that no unrelated user changes were overwritten.

## 11. Final report

Provide a structured report containing:

1. Project and workspace identification.
2. Workflow mode.
3. Tasks delegated and their task IDs.
4. Agents and skills used.
5. Findings and priorities.
6. Implemented changes, if authorized.
7. Verification results.
8. Failed, skipped or blocked tasks.
9. Remaining risks.
10. Recommended next steps.

Never claim completion when required tasks remain unfinished.
