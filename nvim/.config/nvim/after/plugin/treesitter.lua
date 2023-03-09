require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "ruby",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
  },
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    additional_vim_regex_highlighting = {"markdown"},
  },
  rainbow = {
    enable = true,
  },
}

vim.cmd([[
  highlight! TSRainbowRed guifg=#ff5555
  highlight! TSRainbowYellow guifg=#f1fa8c
  highlight! TSRainbowBlue guifg=#8be9fd
  highlight! TSRainbowOrange guifg=#ffb86c
  highlight! TSRainbowGreen guifg=#50fa7b
  highlight! TSRainbowViolet guifg=#bd93f9
  highlight! TSRainbowCyan guifg=#ff79c6
]])

require('treesitter-context').setup({})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
