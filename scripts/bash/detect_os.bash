#!/bin/bash

system="$(uname)"

if [ "$system" = "Linux" ]; then
    # Default distro name if no release file is found
    distro="Linux"

    # Try /etc/os-release (standard on modern distros)
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        distro="${NAME:-Linux}"
    fi

elif [ "$system" = "FreeBSD" ]; then
    distro="FreeBSD"

else
    # Fallback for other Unix-likes
    distro="$system"
fi

printf "%s\n" "$distro"
