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

    if [[ -e "$dest" && ! -L "$dest" ]]; then
        echo "The path $dest already exists and its not a symlink."

        read -p "Want to overwrite it? (Y/n) " answer
        if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
            echo "Skipping $dest"
            return
        fi

        echo "Removing $dest..."
        rm -rf "$dest"
    fi
    ln -sfn "$src" "$dest"
    echo "Linked: $src → $dest"
}

echo "[2/3] Creating symlinks..."
link nvim ~/.config/nvim
link sway ~/.config/sway
link tmux ~/.config/tmux
link waybar ~/.config/waybar
link alacritty ~/.config/alacritty

echo "[3/3] Done! Dotfiles successfully installed."
