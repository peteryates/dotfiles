-- not sure how to represent '+' and '*' as keys in a lua table
vim.cmd [[
  let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'tmux load-buffer -',
      \      '*': 'tmux load-buffer -',
      \    },
      \   'paste': {
      \      '+': 'tmux save-buffer -',
      \      '*': 'tmux save-buffer -',
      \   },
      \   'cache_enabled': 1,
      \ }
]]
