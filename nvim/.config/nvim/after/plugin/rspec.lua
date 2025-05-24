local opts = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>rI", "<cmd>lua require('rspec').run_current_file()<cr>", opts)
vim.keymap.set("n", "<leader>ri", "<cmd>lua require('rspec').run_current_example()<cr>", opts)
vim.keymap.set("n", "<leader>r.", "<cmd>lua require('rspec').repeat_last_run()<cr>", opts)
vim.keymap.set("n", "<leader>rd", "<cmd>lua require('rspec').debug()<cr>", opts)
vim.keymap.set("n", "<leader>rS", "<cmd>lua require('rspec').run_suite()<cr>", opts)
