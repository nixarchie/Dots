#!/usr/bin/env bash
set -e

cd $DOTFILES_DIR
python3 "$PYTHON_DIR/symlink.py"

ln -s local/bin/pac ~/.local/bin/