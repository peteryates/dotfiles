fish_add_path /usr/share/git-core/contrib
fish_add_path ~/bin

if status is-interactive
  set fish_cursor_default block

  source (/usr/bin/starship init fish --print-full-init | psub)

  fish_config theme choose Dracula
end

alias be='bundle exec'
alias http='xh'
alias ls='exa'
alias l='exa --long'
alias tree='exa --tree'
alias open='xdg-open'
