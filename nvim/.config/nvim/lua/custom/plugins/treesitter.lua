return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'Wansmer/treesj',
    'nvim-treesitter/nvim-treesitter-context',
  },
  lazy = false,
  build = ':TSUpdate'
}
