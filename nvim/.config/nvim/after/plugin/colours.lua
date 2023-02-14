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

vim.cmd([[
  highlight! CursorLine guibg=#21232f

  highlight! CmpItemAbbrMatch guibg=NONE guifg=#8be9fd
  highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch

  highlight! CmpItemKindVariable guibg=NONE guifg=#ffb86c
  highlight! link CmpItemKindInterface CmpItemKindVariable
  highlight! link CmpItemKindText CmpItemKindVariable

  highlight! CmpItemKindFunction guibg=NONE guifg=#ff79c6
  highlight! link CmpItemKindMethod CmpItemKindFunction

  highlight! CmpItemKindKeyword guibg=NONE guifg=#f1fa8c
  highlight! link CmpItemKindProperty CmpItemKindKeyword
  highlight! link CmpItemKindUnit CmpItemKindKeyword

  highlight! CmpItemKindSnippet guibg=NONE guifg=#bd93f9
  highlight! link CmpItemSnippetProperty CmpItemSnippetKeyword
  highlight! link CmpItemSnippetUnit CmpItemSnippetKeyword
]])
