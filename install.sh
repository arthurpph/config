#!/usr/bin/env bash

set -e


REPO_URL="https://github.com/arthurpph/config.git"
DOTFILES="$HOME/.dotfiles"

echo "[1/4] Cloning dotfiles to $DOTFILES..."
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

echo "[2/4] Creating symlinks..."
link nvim ~/.config/nvim
link sway ~/.config/sway
link tmux ~/.config/tmux
link waybar ~/.config/waybar
link alacritty ~/.config/alacritty
link qutebrowser ~/.config/qutebrowser

echo "[3/4] Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

echo "[4/4] Done! Dotfiles successfully installed."

