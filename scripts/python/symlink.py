#!/usr/bin/env python3
import os
import sys
import pathlib

# Get the repo path from environment variable or fail
DOTFILES_DIR = os.environ.get("DOTFILES_DIR")
if not DOTFILES_DIR:
    print("\033[1;31m[ERROR]\033[0m DOTFILES_DIR is not set")
    sys.exit(1)
DOTFILES_DIR = pathlib.Path(DOTFILES_DIR).resolve()

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

        # link directories first
        for d in dirs:
            src = root_path / d
            rel = src.relative_to(source_dir)
            dest = target_base / rel
            symlink(src, dest)

        # then link files
        for f in files:
            src = root_path / f
            rel = src.relative_to(source_dir)
            dest = target_base / rel
            symlink(src, dest)


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

    # Symlink local
    # Symlink config
    local_dir = DOTFILES_DIR / "local/bin/pkgx"
    if local_dir.exists():
        echo_cmd(f"Processing {pretty_path(local_dir)}")
        link_dir(local_dir, HOME / ".local/bin/pkgx")
    else:
        echo_cmd("No local directory in repo, skipping...")

    echo_important("Symlink setup complete!")

if __name__ == "__main__":
    main()
