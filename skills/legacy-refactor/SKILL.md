---
name: legacy-refactor
description: Safely analyze, plan and execute incremental refactoring of existing legacy codebases while preserving behavior, compatibility and project conventions.
---

# Legacy Refactor

## Purpose

Help refactor existing codebases safely and incrementally. Prioritize preserving existing behavior, reducing complexity and improving maintainability over introducing new patterns or technologies.

## Operating modes

Choose the mode based on the user's request:

- **Analysis mode:** Inspect the codebase, identify problems and propose a refactoring plan. Do not modify files.
- **Execution mode:** Implement the refactoring only when the user explicitly asks you to make changes.

Never interpret a request for an audit, review or plan as permission to modify files.

## Before starting

- Identify the current workspace and project.
- Never assume the project name, framework, language or technology stack.
- Base all analysis and changes exclusively on the currently opened project.
- If multiple projects or workspaces are available, ask which one to work on.
- Inspect the project structure, package configuration and existing conventions.
- Check the Git status before making changes.
- Preserve all existing user modifications. Never discard or overwrite unrelated work.
- Understand the current implementation and its behavior before proposing changes.

## Refactoring principles

- Preserve existing functionality and observable behavior.
- Preserve public APIs, component interfaces, data contracts and URL behavior unless explicitly asked to change them.
- Follow existing project conventions unless they are demonstrably problematic.
- Prefer small, focused and reversible changes.
- Avoid unnecessary abstractions, dependencies and architectural rewrites.
- Do not combine unrelated refactoring tasks.
- Avoid broad formatting changes and unrelated cleanup.
- Do not rewrite working code merely to match personal preferences.
- Prefer improving existing architecture over introducing a completely new one.

## Execution workflow

When execution is explicitly authorized:

1. Explain the intended scope and approach.
2. Identify relevant files and dependencies.
3. Establish how the existing behavior can be verified.
4. Make one logical change at a time.
5. Review each change for unintended side effects.
6. Run relevant tests, type checks or linting when appropriate and permitted.
7. Fix regressions introduced by the refactoring.
8. Stop if the scope expands or unexpected architectural problems require a different approach.

Do not install dependencies, change project configuration or introduce new tools without explicit authorization.

Do not commit, push or merge changes unless explicitly requested.

## Vue and frontend considerations

When working with Vue, Nuxt or other frontend projects:

- Respect the existing framework version and project architecture.
- Preserve component props, emits, slots and public component behavior.
- Preserve reactivity semantics and lifecycle behavior.
- Be careful when changing Composition API logic, composables and Pinia stores.
- Consider SSR and hydration behavior in Nuxt applications.
- Preserve routing, middleware, authentication and state persistence behavior.
- Avoid unnecessary component decomposition or abstraction.
- Check accessibility and responsive behavior when UI code changes.

These are considerations, not assumptions. Apply only those relevant to the current project.

## Safety rules

- Never reset, clean or revert the user's working tree.
- Never delete files or remove functionality without explicit authorization.
- Never silently change business logic.
- Never claim tests passed if they were not actually executed.
- Distinguish verified behavior from assumptions.
- If verification is impossible, clearly explain the limitation.
- If a change introduces unexpected failures, stop and report them instead of hiding or bypassing them.

## Final report

After completing work, summarize:

- What changed and why.
- Which files were modified.
- What behavior was preserved.
- Which tests and checks were executed and their results.
- Known risks, limitations or follow-up recommendations.
