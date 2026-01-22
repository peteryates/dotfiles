fish_add_path /usr/share/git-core/contrib
fish_add_path ~/bin

if status is-interactive
  set fish_cursor_default block

  fish_config theme choose Dracula
end
