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
antigen bundle git
antigen bundle git-extras
#antigen bundle gitfast
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

# Load the theme.
antigen theme refined

# Tell Antigen that you're done.
antigen apply

# Some general vim/dev stuff
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=light
 '

export XDG_CONFIG_HOME="$HOME/.config"
export PAGER="less -SX"
export EDITOR="vim"
export LESS="-XFR"

# Useful aliases
alias be='bundle exec'
alias cat='bat'
alias ls='exa'

# Setup LS_COLORS
# . "/home/peter/.local/share/lscolors.sh"

# Load completion files from the ~/.zsh directory.
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Set up direnv for project-specific environment variables
eval "$(direnv hook zsh)"
