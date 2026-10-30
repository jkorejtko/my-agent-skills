#!/bin/bash

set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"

TARGETS=(
  "$HOME/.agents/skills"
  "$HOME/.gemini/config/skills"
)

echo "Installing agent skills from: $ROOT"

# Initialize T3 submodule
git -C "$ROOT" submodule update --init --recursive

for TARGET in "${TARGETS[@]}"; do
  mkdir -p "$TARGET"

  echo ""
  echo "Checking: $TARGET"

  for SKILL_PATH in "$ROOT"/skills/*; do
    [ -d "$SKILL_PATH" ] || continue

    SKILL_NAME="$(basename "$SKILL_PATH")"
    DEST="$TARGET/$SKILL_NAME"

    if [ -L "$DEST" ]; then
      CURRENT="$(readlink "$DEST")"

      if [ "$CURRENT" = "$SKILL_PATH" ]; then
        echo "OK: $SKILL_NAME"
      else
        echo "CONFLICT: $DEST points elsewhere"
      fi

    elif [ -e "$DEST" ]; then
      echo "SKIPPED: $DEST already exists"

    else
      ln -s "$SKILL_PATH" "$DEST"
      echo "LINKED: $SKILL_NAME"
    fi
  done
done

echo ""
echo "Installation check completed."
