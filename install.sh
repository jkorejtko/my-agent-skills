#!/bin/bash

set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"

TARGETS=(
  "$HOME/.agents/skills"
  "$HOME/.gemini/config/skills"
)

case "${1:-}" in
  "") CHECK_ONLY=false ;;
  --check) CHECK_ONLY=true ;;
  *) echo "Usage: $0 [--check]" >&2; exit 2 ;;
esac
if [ "$#" -gt 1 ]; then
  echo "Usage: $0 [--check]" >&2
  exit 2
fi

if ! "$CHECK_ONLY"; then
  echo "Installing agent skills from: $ROOT"
  git -C "$ROOT" submodule update --init --recursive
fi

FAILED=0
SKILLS=()
for SKILL_PATH in "$ROOT"/skills/*; do
  if [ ! -d "$SKILL_PATH" ] && [ ! -L "$SKILL_PATH" ]; then
    continue
  fi
  if [ ! -f "$SKILL_PATH/SKILL.md" ] || [ ! -r "$SKILL_PATH/SKILL.md" ]; then
    echo "ERROR: missing or unreadable source $SKILL_PATH/SKILL.md" >&2
    FAILED=1
    continue
  fi
  SKILLS+=("$SKILL_PATH")
done

if [ "${#SKILLS[@]}" -eq 0 ]; then
  echo "ERROR: no readable skills found in $ROOT/skills" >&2
  exit 1
fi

for TARGET in "${TARGETS[@]}"; do
  if ! "$CHECK_ONLY"; then
    mkdir -p "$TARGET"
  fi

  echo ""
  echo "Checking: $TARGET"

  for SKILL_PATH in "${SKILLS[@]}"; do
    SKILL_NAME="$(basename "$SKILL_PATH")"
    DEST="$TARGET/$SKILL_NAME"

    if ! "$CHECK_ONLY" && [ ! -L "$DEST" ] && [ ! -e "$DEST" ]; then
      ln -s "$SKILL_PATH" "$DEST"
      echo "LINKED: $SKILL_NAME"
    fi

    if [ ! -f "$DEST/SKILL.md" ] || [ ! -r "$DEST/SKILL.md" ]; then
      echo "ERROR: missing or unreadable installed skill $DEST/SKILL.md" >&2
      FAILED=1
    elif [ "$DEST" -ef "$SKILL_PATH" ]; then
      echo "OK: $SKILL_NAME"
    else
      echo "EXTERNAL: $DEST has a readable SKILL.md from another installation"
    fi
  done
done

if [ "$FAILED" -ne 0 ]; then
  exit "$FAILED"
fi

echo "Installation check completed."
