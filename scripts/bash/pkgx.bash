# Online script for install dots-hyprland.
#
# By design this script is for running via piping to bash:
#   bash <(curl -s https://ii.clsty.link/get) [parameters]
# Therefore shebang and execute permission are not needed.
#
# When running locally for testing, run
#   bash get [parameters]

me="-->pkgx-setup<--"
remote_repo=""
local_path=~/.local/bin/pkgx

function z(){
  echo -e "####################################################"
  echo -e "${STY_BLUE}[$0]: Next command:${STY_RST}"
  echo -e "${STY_GREEN}$*${STY_RST}"
  local execute=true
  if $ask;then
    while true;do
      echo -e "${STY_BLUE}Execute? ${STY_RST}"
      echo "  y = Yes"
      echo "  e = Exit now"
      local p; read -p "====> " p
      case $p in
        [yY]) echo -e "${STY_BLUE}OK, executing...${STY_RST}" ;break ;;
        [eE]) echo -e "${STY_BLUE}Exiting...${STY_RST}" ;exit ;break ;;
        *) echo -e "${STY_RED}Please enter [y/e].${STY_RST}";;
      esac
    done
  fi
  if $execute;then x "$@";else
    echo -e "${STY_YELLOW}[$0]: Skipped \"$*\"${STY_RST}"
  fi
}

# ─── Menu (Manual Mode) ─────────────────────────
show_menu() {
  options=("HTTPS" "SSH")

  while true; do
    echo "? What is your preferred protocol for Git operations for pkgx on this host?"
    for i in "${!options[@]}"; do
      echo -e "\033[1;32m$((i+1)).\033[0m ${options[$i]}"
    done

    read -rp $'\nChoose (eg: 1 or 2): ' choice
    case "$choice" in
      1|https|HTTPS|h)
        remote_repo="https://github.com/nixarchie/pkgx.git"
        break
        ;;
      2|ssh|SSH|s)
        remote_repo="git@github.com:nixarchie/pkgx.git"
        break
        ;;
      *)
        echo "Invalid choice, try again."
        ;;
    esac
    echo
  done
}


install_pkgx() {

    echo "$me: path to clone: $local_path"
    #echo "$me: params to pass: $@"

    echo "$me: Downloading repo to $local_path ..."
    x mkdir -p "$local_path"
    x cd "$local_path"
    show_menu
    echo "$me: remote repo: $remote_repo"
    if [ -z "$(ls -A)" ]; then
        x git init -b main
        x git remote add origin $remote_repo
    fi
    git remote get-url origin|grep -q $remote_repo || { echo "Dir \"$local_path\" is not empty, nor a git repo of $remote_repo. Aborting..."; exit 1 ; }
    x git pull origin main && git submodule update --init --recursive
    x git branch --set-upstream-to=origin/main main
    echo "$me: Downloaded."
    echo
    echo "$me: Pkgx has been setup."
    echo
    echo "$me: Goodbye!"
}

[[ "${BASH_SOURCE[0]}" != "$0" ]] || {
  echo "pkgx.sh must be sourced, not executed"
  exit 1
}
