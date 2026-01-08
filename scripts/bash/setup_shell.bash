#!/usr/bin/env bash
set -e

log()   { echo -e "\033[1;32m[INFO]\033[0m $(pretty_path "$1")"; }
pretty_path() {
    local path="$1"
    # Absolute path starting with $HOME → replace with ~
    if [[ "$path" == "$HOME"* ]]; then
        echo "~${path#$HOME}"
    else
        echo "$path"
    fi
}
warn()  { echo -e "\033[1;33m[WARN]\033[0m $(pretty_path "$1")"; }

log "Sourcing shell configs..."

case "$USER_SHELL" in
    fish)
        [ -f "$HOME/.config/fish/config.fish" ] && source "$HOME/.config/fish/config.fish"
        ;;
    zsh)
        [ -f "$HOME/.zshrc" ] && source "$HOME/.zshrc"
        ;;
    bash)
        [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
        ;;
    *)
        warn "Unknown shell — skipping shell sourcing."
        ;;
esac
