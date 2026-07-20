local map = vim.api.nvim_set_keymap
local opt_non_silent = { noremap = true, silent = false }

map("n", "<leader>dh", ":diffget //2<CR>", opt_non_silent)
map("n", "<leader>dl", ":diffget //3<CR>", opt_non_silent)
map("n", "<leader>F",  ":G<CR>",           opt_non_silent)
