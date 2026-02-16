#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/arthurpph/config.git"
DOTFILES="$HOME/.dotfiles"

echo "[1/3] Cloning dotfiles to $DOTFILES..."
if [ ! -d "$DOTFILES" ]; then
    git clone "$REPO_URL" "$DOTFILES"
else
    echo "Directory already exists, skipping..."
    git -C "$DOTFILES" pull
fi

link() {
    src="$DOTFILES/$1"
    dest="$2"

    mkdir -p "$(dirname "$dest")"
    ln -sfn "$src" "$dest"
    echo "Linked: $src → $dest"
}

echo "[2/3] Creating symlinks..."
link nvim ~/.config/nvim
link sway ~/.config/sway
link tmux ~/.config/tmux

echo "[3/3] Done! Dotfiles successfully installed."
