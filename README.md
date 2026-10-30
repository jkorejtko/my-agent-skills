# My Agent Skills

Personal shared AI agent skills library for Codex, T3 Code and Antigravity.

## Structure

- `skills/` – custom skills and links to T3 skills
- `sources/tstack/` – pinned T3 skills repository

## Custom skills

- vue-architecture-review
- test-coverage-analysis
- performance-audit
- legacy-refactor
- project-orchestrator

## Installation

Clone the repository including submodules:

    git clone --recurse-submodules https://github.com/jkorejtko/my-agent-skills.git

Run the installer:

    cd my-agent-skills
    ./install.sh

## Updating

Update the library:

    git pull

Update T3 skills:

    git submodule update --remote sources/tstack
