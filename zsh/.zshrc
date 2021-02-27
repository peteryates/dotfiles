source ~/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Add user scripts
export PATH="$HOME/bin:$PATH"

# Set up rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Set up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle gitfast
antigen bundle npm
antigen bundle gem
antigen bundle dnf
antigen bundle ssh-agent
antigen bundle command-not-found
antigen bundle nvm-auto

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Configure and load blox theme
BLOX_SEG__UPPER_LEFT=( cwd git )
BLOX_SEG__UPPER_RIGHT=( bgjobs )
BLOX_BLOCK__CWD_TRUNC=1
antigen theme yardnsm/blox-zsh-theme

# Tell Antigen that you're done.
antigen apply

# Some general vim/dev stuff
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe,border:#81a1c1
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

export XDG_CONFIG_HOME="$HOME/.config"
export PAGER="less -SX"
export EDITOR="vim"
export LESS="-XFR"

# Useful aliases
alias be='bundle exec'
alias cat='bat'
alias ls='exa'
alias http='xh'

# Setup LS_COLORS
# . "/home/peter/.local/share/lscolors.sh"

# Load completion files from the ~/.zsh directory.
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Set up direnv for project-specific environment variables
eval "$(direnv hook zsh)"
