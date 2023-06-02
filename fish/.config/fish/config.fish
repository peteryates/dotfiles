fish_add_path /usr/share/git-core/contrib
fish_add_path ~/bin

if status is-interactive
  set -U fish_greeting
  set fish_cursor_default block

  fish_config theme choose Dracula
end

alias be='bundle exec'
alias http='xh'
alias ls='exa'
alias l='exa --long'
alias tree='exa --tree'
alias open='xdg-open'
alias icat="kitty +kitten icat"

# directories i frequent
alias fb='cd ~/projects/department-for-education/current/govuk-formbuilder'
alias ecf='cd ~/projects/department-for-education/current/ecf'
alias npq='cd ~/projects/department-for-education/current/npq'
