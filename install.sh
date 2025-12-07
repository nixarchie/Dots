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

# ─── Directories & Vars ─────────────────────────
DOTFILES_DIR="$HOME/Dots"
export DOTFILES_DIR
BACKUP_DIR="$HOME/.Dots_bak"
SCRIPTS_DIR="$DOTFILES_DIR/scripts/bash"
PYTHON_DIR="$DOTFILES_DIR/scripts/python"
PKG_DIR="$DOTFILES_DIR/pkgs"
AUTO_MODE=false
SKIP_UPDATE=false

# ─── Parse Command-line Arguments ───────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --auto) AUTO_MODE=true ;;
        --skip-update) SKIP_UPDATE=true ;;
        *) warn "Unknown option: $1" ;;
    esac
    shift
done

# ─── Ensure Dotfiles Repo Exists ───────────────
if [[ ! -d "$DOTFILES_DIR" ]]; then
    header "Dotfiles repo not found — cloning..."
    run_cmd git clone https://github.com/nixarchie/Dots.git "$DOTFILES_DIR"
fi

#log "Changing directory to $DOTFILES_DIR"
log_cmd "Detected dotfiles dir: $(pretty_path "$DOTFILES_DIR")"
cd "$DOTFILES_DIR"

# ─── Detect Shell & Distro ──────────────────────
USER_SHELL=$(basename "$SHELL")

if [ "$(command -v python3)" ]; then
    DISTRO=$(python3 "$PYTHON_DIR/detect_os.py")
else 
    DISTRO=$($SCRIPTS_DIR/detect_os.bash)
fi


# ─── Safe Read Wrapper ─────────────────────────
safe_read() {
    local prompt="$1" varname="$2"
    if [[ -t 0 ]]; then
        read -rp "$prompt" "$varname"
    elif [[ -e /dev/tty ]]; then
        read -rp "$prompt" "$varname" </dev/tty
    else
        log "Non-interactive environment — defaulting to yes."
        eval "$varname='y'"
    fi
}

# ─── Run Scripts ────────────────────────────────
run_script() {
    local script_name="$1"
    local script_path="$SCRIPTS_DIR/$script_name"

    if [[ ! -f "$script_path" ]]; then
        warn "$script_name not found, skipping."
        return
    fi

    if $AUTO_MODE; then
        log_cmd "Running $script_name..."
        source "$script_path"
    else
        local choice
        safe_read "Run $script_name? [Y/n] " choice
        case "$choice" in
            [nN]*) log_cmd "Skipping $script_name" ;;
            *) log_cmd "Running $script_name..."; source "$script_path" ;;
        esac
    fi
    echo
}

# ─── Menu (Manual Mode) ─────────────────────────
show_menu() {
    header "Nixie's Multi-Distro Bootstrap"
    log_cmd "Detected distro: $DISTRO"
    log_cmd "Detected shell: $USER_SHELL"


    options=(
        "Update System Packages"
        "Install Packages"
        "Symlink Configs"
        "Setup Shell"
        "Install Flatpaks"
        "Exit"
    )

    scripts=(
        "update_system.sh"
        "install_pkgs.sh"
        "symlink.sh"
        "setup_shell.sh"
        "install_flatpak.sh"
    )

    while true; do
        for i in "${!options[@]}"; do
            echo -e "\033[1;32m$((i+1)).\033[0m ${options[$i]}"
        done

        read -rp $'\nChoose what to run (or q to quit): ' choice
        case "$choice" in
            1) run_script "${scripts[0]}" ;;
            2) run_script "${scripts[1]}" ;;
            3) run_script "${scripts[2]}" ;;
            4) run_script "${scripts[3]}" ;;
            5) run_script "${scripts[4]}" ;;
            6|q|Q) echo_cmd "Goodbye!"; break ;;
            *) warn "Invalid choice." ;;
        esac
        echo
    done
}

# ─── Auto Mode Execution ────────────────────────
if $AUTO_MODE; then

    header "Nixie's Multi-Distro Bootstrap"
    log_cmd "Detected distro: $DISTRO"
    log_cmd "Detected shell: $USER_SHELL"

    if ! $SKIP_UPDATE; then
        echo_cmd "Running system update..."
        run_script "update_system.sh"
    else
        echo_cmd "Skipping system update as requested."
    fi

    for script in "install_pkgs.sh" "stow_configs.sh" "setup_shell.sh" "install_flatpak.sh"; do
        run_script "$script"
    done

    echo_cmd "Bootstrap complete. Enjoy your setup 🎉"
else
    show_menu
fi
