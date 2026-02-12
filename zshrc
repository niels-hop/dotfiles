
. "$HOME/.local/bin/env"

# Case-insensitive and partial word completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Spaceship prompt
source /opt/homebrew/opt/spaceship/spaceship.zsh

# Development folder navigation aliases
alias ddev='cd ~/Dev'
alias dprod='cd ~/Dev/_PRODUCTION'
alias ddev-folder='cd ~/Dev/_DEVELOPMENT'
alias dagents='cd ~/Dev/_AGENTS'
alias dres='cd ~/Dev/_RESEARCH'
alias dtpl='cd ~/Dev/_TEMPLATES'
alias dutil='cd ~/Dev/_UTILITIES'
alias dref='cd ~/Dev/_REFERENCE'

# Quick project listing
alias dls='ls -la ~/Dev | grep "^d" | awk "{print \$NF}" | grep "^_"'
alias dprojects='cd ~/Dev && find . -maxdepth 2 -type d | sort'

# Find project by name
dfind() {
  find ~/Dev -maxdepth 2 -type d -name "*$1*" 2>/dev/null | head -10
}

# Tmux helper: attach to existing session or create new one
alias ta='tmux attach || tmux new -s main'

# Source local machine-specific config
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
