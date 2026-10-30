---
name: project-orchestrator
description: Coordinate multi-agent software project workflows using T3 Code orchestration and specialized skills. Use for comprehensive project audits, task planning, implementation coordination and verification.
---

# Project Orchestrator

## Purpose

Coordinate complex software engineering workflows using specialized skills and delegated child agents.

Act as the central coordinator. Delegate independent work, collect results, prioritize findings and coordinate implementation and verification.

Do not perform every task yourself when suitable specialized agents are available.

## 1. Workspace identification

Before starting:

- Identify the currently opened workspace and project.
- Never assume the project name, framework, language or technology stack.
- Base all findings and actions exclusively on the current project.
- If multiple projects or workspaces are available, ask which one to use.
- Inspect the project structure and relevant configuration.
- Check Git status before any implementation.
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
- `legacy-refactor`: Safe incremental refactoring.
- Other project-specific skills when available.

Do not force irrelevant skills into a workflow.

Before delegating, explicitly instruct each child agent to use its assigned skill.

If a child agent cannot access the assigned skill, report this limitation. Do not claim that the skill was used.

## 4. Orchestration

When T3 Code orchestration tools are available:

- Use `orchestrator_capabilities` to inspect available providers and delegation capabilities when needed.
- Use `delegate_task` to create independent child tasks.
- Launch independent tasks concurrently rather than sequentially.
- Use `task_status` to monitor delegated work.
- Use `task_cancel` when cancellation is necessary.
- Record every task ID and its purpose.
- Wait for all required tasks before final consolidation.

Choose providers based on availability and task suitability.

Do not assume every provider supports child tasks.

If orchestration tools are unavailable, explain the limitation and offer a sequential workflow.

## 5. Task design

Every delegated task must contain:

- A specific objective.
- The exact project and workspace context.
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
4. Security review, if a relevant skill is available.

After delegation:

- Collect all task IDs.
- Monitor progress.
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
