# Dotfiles

Personal configuration files.

## Quick Setup

### macOS / Linux
```bash
git clone https://github.com/niels-hop/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

### Windows (PowerShell - Run as Administrator)
```powershell
git clone https://github.com/niels-hop/dotfiles.git $env:USERPROFILE\dotfiles
cd $env:USERPROFILE\dotfiles
.\install.ps1
```

## Manual Setup

### Tmux
```bash
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Install plugins
In tmux, press `C-Space I` (capital i) to install plugins.

## Usage
- `C-Space r` - Reload config
- `C-Space s` - Session picker  
- `C-Space w` - Window picker
- `C-Space h/j/k/l` - Navigate panes (vim-style)
- `C-Space S` - New session
- `C-Space W` - New window
- `C-Space R` - Rename session
- `C-Space ,` - Rename window