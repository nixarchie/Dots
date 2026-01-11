# Auto start Hyprland on tty1
if test -z "$DISPLAY"; and test "$XDG_VTNR" -eq 1
    start-hyprland
end
