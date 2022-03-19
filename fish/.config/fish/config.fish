fish_add_path /usr/share/git-core/contrib
fish_add_path ~/bin

if status is-interactive
  set fish_cursor_default block

  source (/usr/bin/starship init fish --print-full-init | psub)

  # fish_config theme choose dracula
end

alias be='bundle exec'
alias http='xh'
alias l='exa -l'
alias ls='exa'
alias open='xdg-open'
