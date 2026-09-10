local opt_non_silent = { noremap = true, silent = false }

vim.api.nvim_set_keymap("n", "<leader>dh", ":diffget //2<CR>", opt_non_silent)
vim.api.nvim_set_keymap("n", "<leader>dl", ":diffget //3<CR>", opt_non_silent)
vim.api.nvim_set_keymap("n", "<leader>F",  ":G<CR>",           opt_non_silent)

vim.keymap.set('i', "''", "''<Left>")
vim.keymap.set('i', '""', '""<Left>')
