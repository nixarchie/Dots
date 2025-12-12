#!/usr/bin/env bash
set -e

# ─── Colors & Logging ─────────────────────────────
log()   { echo -e "\033[1;32m[INFO]\033[0m $(pretty_path "$1")"; }
warn()  { echo -e "\033[1;33m[WARN]\033[0m $(pretty_path "$1")"; }
error() { echo -e "\033[1;31m[ERROR]\033[0m $(pretty_path "$1")"; }

echo_cmd() { echo -e "\033[1;32m───\033[0m $(pretty_path "$1")"; }
log_cmd()  { echo -e "\033[1;32m───>\033[0m $(pretty_path "$1")"; }
run_cmd() {
    # Build a pretty display of the command, replacing $HOME with ~
    local display_cmd=()
    for arg in "$@"; do
        display_cmd+=("$(pretty_path "$arg")")
    done

    echo -e "\033[1;34m>>> ${display_cmd[*]}\033[0m"
    "$@"
}

header()   { echo -e "\n\033[1;35m─── $1 ───\033[0m\n"; }

pretty_path() {
    local path="$1"
    # Absolute path starting with $HOME → replace with ~
    if [[ "$path" == "$HOME"* ]]; then
        echo "~${path#$HOME}"
    else
        echo "$path"
    fi
}


log "Ensuring Flatpak setup..."

if ! command -v flatpak &>/dev/null; then
    log "Flatpak not found — installing..."
    case "$DISTRO" in
        arch) yay -S --noconfirm flatpak ;;
        debian) sudo apt install -y flatpak ;;
        fedora) sudo dnf install -y flatpak ;;
        nix) nix profile install nixpkgs.flatpak ;;
        *) brew install flatpak ;;
    esac
fi

if ! flatpak remote-list | grep -q flathub; then
    log "Adding Flathub..."
    run_cmd flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

if ! flatpak list | grep -q io.github.zen_browser.zen; then
    log "Installing Zen Browser..."
    run_cmd flatpak install -y flathub io.github.zen_browser.zen
else
    log "Zen Browser already installed — skipping."
fi
