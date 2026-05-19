require("arborist").setup({
  update_cadence = "weekly",
  -- overrides = {
  --   my_language = { url = "https://github.com/me/tree-sitter-my-language" },
  -- },
})

local tsj = require('treesj')

tsj.setup({
  use_default_keymaps = true,
  check_syntax_error = true,
  max_join_length = 200,
  cursor_behavior = 'hold',
  notify = true,
  langs = {},
  dot_repeat = true,
})

vim.keymap.set('n', 'gS', require('treesj').split)
vim.keymap.set('n', 'gJ', require('treesj').join)

local colors = require('dracula').colors()

vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { bg = colors['selection'] })
vim.api.nvim_set_hl(0, 'TreesitterContextLineNumberBottom', { bg = colors['selection'] })
