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

# Create symbolic link (requires admin privileges)
try {
    New-Item -ItemType SymbolicLink -Path $tmuxConfigPath -Target $sourcePath -Force | Out-Null
    Write-Host "✅ Tmux config linked" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to create symbolic link. Running as Administrator required." -ForegroundColor Red
    Write-Host "   Alternative: Copy the file manually:" -ForegroundColor Yellow
    Write-Host "   Copy-Item '$sourcePath' '$tmuxConfigPath'" -ForegroundColor Gray
    exit 1
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