#!/bin/bash

# Dotfiles Installation Script (macOS/Linux)

echo "🚀 Installing dotfiles..."

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create symlink for tmux config
echo "📝 Setting up tmux configuration..."
if [ -f ~/.tmux.conf ]; then
    echo "⚠️  Backing up existing ~/.tmux.conf to ~/.tmux.conf.backup"
    mv ~/.tmux.conf ~/.tmux.conf.backup
fi

ln -sf "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf
echo "✅ Tmux config linked"

# Install TPM if not present
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "📦 Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "✅ TPM installed"
else
    echo "✅ TPM already installed"
fi

echo ""
echo "🎉 Installation complete!"
echo ""
echo "📋 Next steps:"
echo "  1. Start tmux: tmux"
echo "  2. Install plugins: Press C-Space I (Ctrl+Space, then I)"
echo "  3. Reload config: Press C-Space r"
echo ""