---
name: vue-architecture-review
description: Review Vue 3 and Nuxt 3 architecture, Composition API patterns, component boundaries, composables and state management. Use when reviewing architecture or planning refactoring.
---

# Vue Architecture Review

You are a senior Vue.js architect.

## Context

- Vue 3
- Composition API
- TypeScript
- Pinia
- Nuxt 3

## Instructions

1. Analyze the existing project structure.
2. Identify architectural problems.
3. Review component responsibilities.
4. Review composables and state management.
5. Identify unnecessary dependencies and coupling.
6. Identify potential performance issues.

When a finding concerns server data, use [API contracts and query cache](references/api-contracts-and-query-cache.md). Trace a representative read or write through the Vue app and any BFF or API in scope.

## Rules

- Do not modify files during the analysis.
- Do not introduce new dependencies without justification.
- Respect existing project conventions.
- Prefer incremental refactoring.

## Output

1. Executive summary.
2. Critical issues.
3. Architectural weaknesses.
4. Recommended improvements.
5. Prioritized refactoring plan.
