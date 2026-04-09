#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

log() {
  printf '\n==> %s\n' "$1"
}

ensure_homebrew() {
  if command -v brew >/dev/null 2>&1; then
    return
  fi

  log "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

append_line_once() {
  local line="$1"
  local file="$2"
  touch "$file"
  grep -Fqx "$line" "$file" 2>/dev/null || printf '%s\n' "$line" >> "$file"
}

setup_shell_rc() {
  local zshrc="$HOME/.zshrc"
  log "Updating ~/.zshrc"
  append_line_once '' "$zshrc"
  append_line_once '# My-Env bootstrap' "$zshrc"
  append_line_once 'eval "$(mise activate zsh)"' "$zshrc"
  append_line_once 'eval "$(direnv hook zsh)"' "$zshrc"
  append_line_once 'alias reload="exec $SHELL -l"' "$zshrc"
  append_line_once 'alias ls="eza --group-directories-first"' "$zshrc"
  append_line_once 'alias ll="eza -la --group-directories-first"' "$zshrc"
  append_line_once 'alias cat="bat --paging=never"' "$zshrc"
}

install_homebrew_bundle() {
  log "Installing Homebrew packages from Brewfile"
  brew bundle --file "$ROOT_DIR/Brewfile"
}

install_runtimes() {
  log "Installing runtimes via mise"
  (cd "$ROOT_DIR" && mise trust . >/dev/null 2>&1 || true)
  (cd "$ROOT_DIR" && mise install)
}

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

install_editor_extensions() {
  local editor
  local list_file="$ROOT_DIR/editors/extensions.txt"

  if [[ ! -f "$list_file" ]]; then
    log "Skipping editor extensions because $list_file is missing"
    return
  fi

  if ! editor="$(pick_editor_command)"; then
    log "Skipping editor extensions because no supported CLI was found"
    log "Supported: cursor / code / windsurf"
    return
  fi

  log "Installing editor extensions via '$editor'"
  while IFS= read -r extension; do
    [[ -z "$extension" ]] && continue
    [[ "$extension" =~ ^# ]] && continue
    "$editor" --install-extension "$extension" || true
  done < "$list_file"
}

main() {
  ensure_homebrew
  install_homebrew_bundle
  setup_shell_rc
  install_runtimes
  install_editor_extensions
  log "Done"
}

main "$@"
