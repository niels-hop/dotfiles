# Sync script for Windows (when symbolic links aren't available)
# Run this after updating your dotfiles to sync changes

Write-Host "🔄 Syncing dotfiles to local config..." -ForegroundColor Green

$DOTFILES_DIR = Split-Path -Parent $MyInvocation.MyCommand.Definition
$tmuxConfigPath = "$env:USERPROFILE\.tmux.conf"
$sourcePath = "$DOTFILES_DIR\tmux.conf"

if (Test-Path $sourcePath) {
    Copy-Item $sourcePath $tmuxConfigPath -Force
    Write-Host "✅ Tmux config synced" -ForegroundColor Green
} else {
    Write-Host "❌ Source file not found: $sourcePath" -ForegroundColor Red
}

Write-Host "💡 Tip: In tmux, press C-Space r to reload the config" -ForegroundColor Cyan