fish_add_path /usr/share/git-core/contrib
fish_add_path ~/bin

if status is-interactive
  set -U fish_greeting
  set fish_cursor_default block

  fish_config theme choose Dracula
end

alias be='bundle exec'
alias http='xh'
alias ls='eza'
alias l='eza --long'
alias tree='eza --tree'
alias open='xdg-open'
alias icat="kitty +kitten icat"

# directories i frequent
alias fb='cd ~/projects/x-govuk/govuk-formbuilder'
alias ecf='cd ~/projects/department-for-education/cpd/ecf'
alias ecf2='cd ~/projects/department-for-education/cpd/ecf2'
alias npq='cd ~/projects/department-for-education/cpd/npq'
