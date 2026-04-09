#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
LIST_FILE="$ROOT_DIR/editors/extensions.txt"

pick_editor_command() {
  local candidate
  for candidate in cursor code windsurf; do
    if command -v "$candidate" >/dev/null 2>&1; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  return 1
}

if [[ ! -f "$LIST_FILE" ]]; then
  echo "Extension list not found: $LIST_FILE"
  exit 1
fi

if ! EDITOR_CMD="$(pick_editor_command)"; then
  echo "No supported editor CLI found"
  echo "Install one of: cursor, code, windsurf"
  echo "Then make sure its shell command is available in PATH"
  exit 1
fi

while IFS= read -r extension; do
  [[ -z "$extension" ]] && continue
  [[ "$extension" =~ ^# ]] && continue
  "$EDITOR_CMD" --install-extension "$extension"
done < "$LIST_FILE"
