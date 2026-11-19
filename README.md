# Agent Dev Skills

Reusable skills for Codex, T3 Code, and Antigravity. Review architecture, test
quality, UX, security, and performance, plan a refactor, or coordinate an audit
across repositories.

## Custom skills

| Skill | When to use it |
| --- | --- |
| [vue-architecture-review](skills/vue-architecture-review/SKILL.md) | Review Vue or Nuxt component boundaries, composables, and state management. |
| [test-coverage-analysis](skills/test-coverage-analysis/SKILL.md) | Assess test quality and find important scenarios without coverage. |
| [performance-audit](skills/performance-audit/SKILL.md) | Identify and prioritize likely bottlenecks across frontend, SSR, caching, and backend for frontend. |
| [real-browser-audit](skills/real-browser-audit/SKILL.md) | Measure Lighthouse load metrics, interaction latency, and layout stability during actions such as hover and filtering. |
| [ux-audit](skills/ux-audit/SKILL.md) | Review user journeys, responsive layouts, keyboard and touch controls, and UI copy. |
| [security-audit](skills/security-audit/SKILL.md) | Review application code, API authorization, dependencies, and deployment configuration. |
| [legacy-refactor](skills/legacy-refactor/SKILL.md) | Refactor incrementally while preserving observable behavior. |
| [project-orchestrator](skills/project-orchestrator/SKILL.md) | Combine specialized skills for larger audits and coordinate work across repositories. |

The security audit methodology draws on
[Agentic Security Workspace](https://github.com/BleedingDev/agentic-security-workspace).
See the [attribution and MIT notice](skills/security-audit/references/upstream-license.md).

## TStack skills

The pinned [TStack submodule](sources/tstack) supplies `babysit-pr`, `council`,
`file-pr`, `full-send`, `full-stop`, `leaving-pr-comments`, `modernize`,
`sol-loop`, and `takeover`. The `skills/` directory links to these upstream
skills alongside the custom ones.

## Installation

Clone the repository including submodules:

    git clone --recurse-submodules https://github.com/jkorejtko/my-agent-skills.git

Run the installer:

    cd my-agent-skills
    ./install.sh

The installer creates links in `~/.agents/skills` and `~/.gemini/config/skills`.
Keep the checkout at the same path so the links continue to work.

Run `./install.sh --check` to check both installation directories without
creating links or initializing the submodule. A missing or unreadable
`SKILL.md` fails the check. Readable skills installed from elsewhere are
reported as external and preserved.

## Updating

After pulling library changes, rerun the installer. It syncs TStack to the
recorded revision and links any newly added skills.

    git pull
    ./install.sh

To move TStack to a newer upstream revision when maintaining this repository:

    git submodule update --remote sources/tstack

## Feedback and contact

- [Report a bug or suggest a skill](https://github.com/jkorejtko/my-agent-skills/issues)
- [Connect with me on LinkedIn](https://www.linkedin.com/in/ji%C5%99%C3%AD-korejtko-a21916107/)
