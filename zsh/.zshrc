source ~/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Add user scripts
export PATH="$HOME/bin:$PATH"

# Add diff-highlight to path
export PATH="/usr/share/git-core/contrib:$PATH"
export PATH="/home/peter/.local/bin:$PATH"

# Set up rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Set up fnm
eval "$(fnm env)"

autoload -Uz compinit && compinit

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
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Tell Antigen that you're done.
antigen apply

# Some general vim/dev stuff
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

export XDG_CONFIG_HOME="$HOME/.config"
export PAGER="less -SX"
export EDITOR="vim"
export LESS="-XFR"

# Useful aliases
alias be='bundle exec'
alias cat='bat'
alias ls='exa'
alias http='xh'
alias yank='yank-cli'

# Setup LS_COLORS
# . "/home/peter/.local/share/lscolors.sh"

# Load completion files from the ~/.zsh directory.
fpath=(~/.zsh $fpath)

# Some fzf stuff
export FZF_COMPLETION_OPTS='--border --info=inline'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

source /usr/share/zsh/site-functions/fzf

# Set up direnv for project-specific environment variables
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
