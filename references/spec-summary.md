# Agent Skills specification — summary

Source: https://agentskills.io/specification.md

## Core idea

An Agent Skill is a folder containing a `SKILL.md` file. The file includes metadata (`name` and `description`, at minimum) and instructions that tell an agent how to perform a specific task. Skills can bundle scripts, references, templates, and other resources.

## Required

- A folder
- A `SKILL.md` inside it
- `name` and `description` metadata in `SKILL.md`

## Optional

- `scripts/` — executable code
- `references/` — documentation
- `assets/` — templates and resources
- Any additional files or directories

## Progressive disclosure

1. Discovery: agents load only `name` and `description` of each skill at startup.
2. Activation: when a task matches, the agent reads the full `SKILL.md`.
3. Execution: the agent follows the instructions, runs bundled scripts, loads references.

## Full spec

Read the complete specification: https://agentskills.io/specification.md

Quickstart: https://agentskills.io/skill-creation/quickstart.md

Open standard (originally developed by Anthropic): https://github.com/agentskills/agentskills
