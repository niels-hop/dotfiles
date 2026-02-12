#!/bin/bash

# Dotfiles Installation Script (macOS/Linux)

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

backup_and_link() {
    local source="$1"
    local target="$2"
    local name="$3"

    if [ -L "$target" ]; then
        rm "$target"
    elif [ -e "$target" ]; then
        echo "  Backing up existing $target to ${target}.backup"
        mv "$target" "${target}.backup"
    fi

    ln -sf "$source" "$target"
    echo "  $name linked"
}

echo "Installing dotfiles..."

# Tmux
echo "Tmux:"
backup_and_link "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf" "tmux.conf"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "  Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Ghostty
echo "Ghostty:"
mkdir -p "$HOME/.config/ghostty"
backup_and_link "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config" "config"
backup_and_link "$DOTFILES_DIR/ghostty/themes" "$HOME/.config/ghostty/themes" "themes"

# Zsh
echo "Zsh:"
backup_and_link "$DOTFILES_DIR/zshrc" "$HOME/.zshrc" "zshrc"

# Spaceship
echo "Spaceship:"
backup_and_link "$DOTFILES_DIR/spaceshiprc.zsh" "$HOME/.spaceshiprc.zsh" "spaceshiprc.zsh"

if ! command -v spaceship &>/dev/null && command -v brew &>/dev/null; then
    echo "  Installing spaceship prompt via brew..."
    brew install spaceship
fi

echo ""
echo "Done! Next steps:"
echo "  1. Create ~/.zshrc.local for machine-specific config (PATH, tools, etc.)"
echo "  2. Restart your shell: exec zsh"
echo "  3. In tmux: press C-Space I to install plugins"
