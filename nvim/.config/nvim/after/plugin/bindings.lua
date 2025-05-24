-- Modes
-- * normal_mode = "n",
-- * insert_mode = "i",
-- * visual_mode = "v",
-- * visual_block_mode = "x",
-- * term_mode = "t",
-- * command_mode = "c",

local map = vim.api.nvim_set_keymap
local opt_silent = { noremap = true, silent = true }
local opt_non_silent = { noremap = true, silent = false }

map("n", "gD",    ":lua vim.lsp.buf.declaration()<CR>",      opt_silent)
map("n", "gd",    ":lua vim.lsp.buf.definition()<CR>",       opt_silent)
-- map("n", "gr",    ":lua vim.lsp.buf.references()<CR>",       opt_silent)
-- map("n", "K",     ":lua vim.lsp.buf.signature_help()<CR>",   opt_silent)
-- map("n", "<A-r>", ":lua vim.lsp.buf.rename()<CR>",           opt_silent)
-- map("n", "<A-c>", ":lua vim.lsp.buf.code_action()<CR>",      opt_silent)
map("n", "<A-n>", ":cnext<CR>",                              opt_silent)
map("n", "<A-p>", ":cprev<CR>",                              opt_silent)

map("n", "<leader>dh", ":diffget //2<CR>", opt_non_silent)
map("n", "<leader>dl", ":diffget //3<CR>", opt_non_silent)
map("n", "<leader>F",  ":G<CR>",           opt_non_silent)
