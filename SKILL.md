---
name: agent-skills
description: Teaches an agent how to author Agent Skills — writing SKILL.md metadata and instructions, choosing folder structure (scripts, references, assets), and validating the result against the Agent Skills format.
---

# Agent Skills

This skill shows an agent how to create a new Agent Skill in the standard format: a folder containing at least a `SKILL.md` with `name` and `description` metadata plus instructions, and optionally `scripts/`, `references/`, `assets/`, and other files.

## When to use this skill

Use it when you need to package procedural knowledge or company-, team-, or user-specific context into a portable, version-controlled skill folder that a skills-compatible agent can load on demand.

## The format in three stages (progressive disclosure)

1. **Discovery** — At startup, agents load only each skill's `name` and `description`, just enough to know when it might be relevant.
2. **Activation** — When a task matches, the agent reads the full `SKILL.md` instructions into context.
3. **Execution** — The agent follows the instructions, optionally running bundled scripts or loading referenced files.

Keep this in mind while writing: the `name` and `description` carry most of the load at discovery time, so make them precise.

## Step 1: Pick a name and description

Choose a short, descriptive `name` (kebab-case is conventional, e.g. `code-review`, `db-migrator`) and a one-line `description` that states what the skill does and when it's relevant. These are the only required metadata fields.

## Step 2: Scaffold the folder

Create a folder for the skill with at least this:

```
my-skill/
├── SKILL.md          # Required: metadata + instructions
├── scripts/          # Optional: executable code
├── references/       # Optional: documentation
├── assets/           # Optional: templates, resources
└── ...               # Any additional files or directories
```

Only add `scripts/`, `references/`, or `assets/` when they genuinely support the skill's task. Don't add folders just to fill the structure.

## Step 3: Write SKILL.md

`SKILL.md` has two parts:

**Metadata header** (top of file):
```
name: my-skill
description: One-line summary of what this skill does and when to use it.
```

**Instructions body** (everything below):
- Purpose — what the skill is for and when to activate it.
- Prerequisites / context the agent needs.
- Step-by-step procedure the agent should follow.
- Any bundled scripts to run and references to read.
- A validation checklist so the agent can prove the work.

See `templates/skill-template.md` for a fill-in-the-blanks skeleton, and `references/spec-summary.md` for a condensed version of the full specification at https://agentskills.io/specification.md.

## Step 4: Add supporting files (only when useful)

- `scripts/` — executable code the agent should run as part of the skill. Keep scripts small and single-purpose.
- `references/` — documentation the agent should read before executing.
- `assets/` — templates, examples, or static resources the skill needs.

## Step 5: Validate

Run `scripts/validate-skill.sh` against the folder, or check manually:
- [ ] Folder contains a `SKILL.md`
- [ ] `SKILL.md` has a `name:` field
- [ ] `SKILL.md` has a `description:` field
- [ ] Instructions are actionable and tell the agent what to do
- [ ] Any referenced scripts/references/assets actually exist
- [ ] `name` and `description` are specific enough for discovery

## Related files

- `templates/skill-template.md` — fill-in template for a new `SKILL.md`
- `references/spec-summary.md` — condensed Agent Skills specification
- `scripts/validate-skill.sh` — structural validation for a skill folder