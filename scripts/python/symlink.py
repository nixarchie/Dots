#!/usr/bin/env python3
import os
import sys
import pathlib

DOTFILES_DIR = pathlib.Path.home() / "Dots"
HOME = pathlib.Path.home()

# Helper to shorten paths with ~
def pretty_path(path):
    try:
        return str(path).replace(str(HOME), "~")
    except Exception:
        return str(path)

# Logging
def log(msg):
    print(f"\033[1;32m[INFO]\033[0m {msg}")

def echo_cmd(msg):
    print(f"─── {msg}")

def echo_important(msg):
    print(f"───> {msg}")

def symlink(src: pathlib.Path, dest: pathlib.Path):
    """Create symlink dest -> src"""
    if dest.exists() or dest.is_symlink():
        if dest.is_symlink():
            dest.unlink()  # remove old symlink
        else:
            echo_important(f"Skipping {pretty_path(dest)}: exists and is not a symlink")
            return
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.symlink_to(src)
    echo_important(f"Symlinking {pretty_path(dest)} ───> {pretty_path(src)}")

def link_dir(source_dir: pathlib.Path, target_base: pathlib.Path):
    for root, dirs, files in os.walk(source_dir):
        root_path = pathlib.Path(root)
        for name in files + dirs:
            src_path = root_path / name
            rel_path = src_path.relative_to(source_dir)
            dest_path = target_base / rel_path
            symlink(src_path, dest_path)

def main():
    if not DOTFILES_DIR.exists():
        log(f"Dotfiles repo {DOTFILES_DIR} does not exist")
        sys.exit(1)

    echo_important("Running symlink setup...")

    # Symlink home
    home_dir = DOTFILES_DIR / "home"
    if home_dir.exists():
        echo_cmd(f"Processing {pretty_path(home_dir)}")
        link_dir(home_dir, HOME)
    else:
        echo_cmd("No home directory in repo, skipping...")

    # Symlink config
    config_dir = DOTFILES_DIR / "config"
    if config_dir.exists():
        echo_cmd(f"Processing {pretty_path(config_dir)}")
        link_dir(config_dir, HOME / ".config")
    else:
        echo_cmd("No config directory in repo, skipping...")

    echo_important("Symlink setup complete!")

if __name__ == "__main__":
    main()
