#!/usr/bin/env bash
# validate-skill.sh — structural validation for an Agent Skill folder.
#
# Usage: ./validate-skill.sh <skill-folder>
#
# Exits 0 if the folder looks like a valid Agent Skill, non-zero otherwise.

set -euo pipefail

SKILL_DIR="${1:-.}"
SKILL_MD="$SKILL_DIR/SKILL.md"

echo "Validating Agent Skill at: $SKILL_DIR"

if [[ ! -d "$SKILL_DIR" ]]; then
  echo "ERROR: not a directory: $SKILL_DIR" >&2
  exit 1
fi

if [[ ! -f "$SKILL_MD" ]]; then
  echo "ERROR: SKILL.md not found in $SKILL_DIR" >&2
  exit 1
fi

if [[ "$(head -n 1 "$SKILL_MD")" != "---" ]]; then
  echo "ERROR: SKILL.md must start with a '---' YAML frontmatter delimiter" >&2
  exit 1
fi

# Extract the frontmatter block (between the first two '---' lines).
FRONTMATTER="$(awk 'NR==1{next} /^---[[:space:]]*$/{exit} {print}' "$SKILL_MD")"

if ! grep -qE '^[[:space:]]*name:' <<<"$FRONTMATTER"; then
  echo "ERROR: SKILL.md frontmatter is missing a 'name:' field" >&2
  exit 1
fi

if ! grep -qE '^[[:space:]]*description:' <<<"$FRONTMATTER"; then
  echo "ERROR: SKILL.md frontmatter is missing a 'description:' field" >&2
  exit 1
fi

echo "OK: SKILL.md present with name and description metadata"

# Warn about empty optional folders that add no value.
for d in scripts references assets; do
  if [[ -d "$SKILL_DIR/$d" ]] && [[ -z "$(ls -A "$SKILL_DIR/$d" 2>/dev/null)" ]]; then
    echo "NOTE: $d/ is empty — consider removing it or adding files."
  fi
done

echo "Validation passed."
