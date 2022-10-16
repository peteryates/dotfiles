local wiki_root = "~/docs/wiki/"
local diary_root = wiki_root .. "diary/"

-- imitate the most commonly used vimwiki keybindings

-- open the wiki index page
vim.api.nvim_set_keymap(
  "n",
  "<leader>ww",
  ":e " .. wiki_root .. "index.md<cr>",
  { silent = true }
)

-- change to today's diary entry
vim.api.nvim_set_keymap(
  "n",
  "<leader>w<leader>w",
  ":e " .. diary_root .. os.date("%Y-%m-%d") .. ".md<cr>",
  { silent = true }
)

-- rebuild and change to the diary index
vim.api.nvim_set_keymap(
  "n",
  "<leader>w<leader>d",
  ":execute '!update-diary-index'<cr>:e" .. diary_root .. "diary.md<cr>",
  { silent = true }
)

vim.g.lists_filetypes = {'markdown'}
