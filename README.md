# Dotfiles

Personal configuration files for tmux, Ghostty, zsh, and spaceship prompt.

## Quick Setup

```bash
git clone https://github.com/niels-hop/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What's Included

| Config | Source | Symlink target |
|---|---|---|
| tmux | `tmux.conf` | `~/.tmux.conf` |
| Ghostty | `ghostty/` | `~/.config/ghostty/config` + `themes/` |
| zsh | `zshrc` | `~/.zshrc` |
| Spaceship | `spaceshiprc.zsh` | `~/.spaceshiprc.zsh` |

## Machine-specific config

Create `~/.zshrc.local` for machine-specific PATH entries, tool configs, etc. This file is sourced at the end of `.zshrc` and is not tracked by git.

## Tmux keybindings

Prefix: `C-Space`

- `r` - Reload config
- `s` / `w` - Session / window picker
- `h/j/k/l` - Navigate panes (vim-style)
- `S` / `W` - New session / window
- `R` / `,` - Rename session / window
- `c` - New window (current path)
- `-` / `\` - Split (current path)
- `I` - Install plugins (TPM)
