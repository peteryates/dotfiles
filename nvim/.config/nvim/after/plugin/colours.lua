vim.g.dracula_italic = 1
vim.opt.background = 'dark'

vim.cmd('colorscheme dracula')
vim.cmd('highlight WinSeparator guibg=None guifg=#44475a')

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function(_)
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 75 })
  end,
})
