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
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "v",
      node_decremental = "V",
    },
  },
}

require('treesitter-context').setup({})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
