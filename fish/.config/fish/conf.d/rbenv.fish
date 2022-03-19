fish_add_path ~/.rbenv/bin

set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths

status --is-interactive; and rbenv init - fish | source
