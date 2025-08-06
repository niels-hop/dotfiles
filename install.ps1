# Dotfiles Installation Script (Windows PowerShell)

Write-Host "🚀 Installing dotfiles..." -ForegroundColor Green

# Get the directory where this script is located
$DOTFILES_DIR = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Create symlink for tmux config
Write-Host "📝 Setting up tmux configuration..." -ForegroundColor Yellow

$tmuxConfigPath = "$env:USERPROFILE\.tmux.conf"
$sourcePath = "$DOTFILES_DIR\tmux.conf"

# Backup existing config if present
if (Test-Path $tmuxConfigPath) {
    Write-Host "⚠️  Backing up existing ~/.tmux.conf to ~/.tmux.conf.backup" -ForegroundColor Yellow
    Move-Item $tmuxConfigPath "$tmuxConfigPath.backup" -Force
}

# Try symbolic link first, fallback to hard copy if no admin rights
try {
    New-Item -ItemType SymbolicLink -Path $tmuxConfigPath -Target $sourcePath -Force -ErrorAction Stop | Out-Null
    Write-Host "✅ Tmux config linked (symbolic link)" -ForegroundColor Green
} catch {
    Write-Host "⚠️  No admin rights for symbolic link, copying file instead..." -ForegroundColor Yellow
    Copy-Item $sourcePath $tmuxConfigPath -Force
    Write-Host "✅ Tmux config copied" -ForegroundColor Green
    Write-Host "   Note: You'll need to manually sync changes from dotfiles folder" -ForegroundColor Gray
}

# Install TPM if not present
$tpmPath = "$env:USERPROFILE\.tmux\plugins\tpm"
if (-not (Test-Path $tpmPath)) {
    Write-Host "📦 Installing TPM (Tmux Plugin Manager)..." -ForegroundColor Yellow
    git clone https://github.com/tmux-plugins/tpm $tpmPath
    Write-Host "✅ TPM installed" -ForegroundColor Green
} else {
    Write-Host "✅ TPM already installed" -ForegroundColor Green
}

Write-Host ""
Write-Host "🎉 Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Cyan
Write-Host "  1. Start tmux: tmux" -ForegroundColor White
Write-Host "  2. Install plugins: Press C-Space I (Ctrl+Space, then I)" -ForegroundColor White
Write-Host "  3. Reload config: Press C-Space r" -ForegroundColor White
Write-Host ""