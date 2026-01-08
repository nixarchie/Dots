# This is NOT a script for execution, but for loading functions, so NOT need execution permission or shebang.

# POSIX sudo keep-alive
SUDO_KEEPALIVE_PID=""

sudo_init_keepalive() {
    # Check if sudo exists
    if ! command -v sudo >/dev/null 2>&1; then
        return 0
    fi

    # Skip if already initialized
    if [ -n "$SUDO_KEEPALIVE_PID" ] && kill -0 "$SUDO_KEEPALIVE_PID" 2>/dev/null; then
        return 0
    fi

    # Prompt for sudo password once
    printf "\033[36m[%s]: Requesting sudo privileges...\033[0m\n" "$0"
    if ! sudo -v; then
        printf "\033[31m[%s]: Failed to obtain sudo privileges. Aborting...\033[0m\n" "$0"
        exit 1
    fi

    # Start background keep-alive
    (
        while true; do
            sleep 60
            sudo -v 2>/dev/null || exit 0
        done
    ) &
    SUDO_KEEPALIVE_PID=$!

    printf "\033[32m[%s]: Sudo session initialized (PID: %s)\033[0m\n" "$0" "$SUDO_KEEPALIVE_PID"
}


# POSIX v()
v() {
    printf "────────────────────────────────────────────────────────────\n"
    printf "%s[%s]: Next command:%s " "$STY_BLUE" "$0" "$STY_RST"
    printf "%s%s%s\n" "$STY_GREEN" "$*" "$STY_RST"

    execute=true

    if [ "$ask" = true ]; then
        while :; do
            printf "%sExecute?%s\n" "$STY_BLUE" "$STY_RST"
            printf "  y = Yes\n"
            printf "  e = Exit now\n"
            printf "  s = Skip this command (NOT recommended)\n"
            printf "  yesforall = Yes and don't ask again (NOT recommended)\n"

            printf "====> "
            IFS= read p

            case "$p" in
                [yY]) printf "%sOK, executing...%s\n" "$STY_BLUE" "$STY_RST"; break ;;
                [eE]) printf "%sExiting...%s\n" "$STY_BLUE" "$STY_RST"; exit ;;
                [sS]) printf "%sSkipping this one...%s\n" "$STY_BLUE" "$STY_RST"; execute=false; break ;;
                yesforall) printf "%sExecuting all remaining...%s\n" "$STY_BLUE" "$STY_RST"; ask=false; break ;;
                *) printf "%sPlease enter [y/e/s/yesforall].%s\n" "$STY_RED" "$STY_RST";;
            esac
        done
    fi

    if [ "$execute" = true ]; then
        x "$@"
    else
        printf "%s[%s]: Skipped \"%s\"%s\n" "$STY_YELLOW" "$0" "$*" "$STY_RST"
    fi
}
