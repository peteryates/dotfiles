return {
  'nvim-treesitter/nvim-treesitter',
  branch = "master",
  dependencies = {
    'Wansmer/treesj',
    'nvim-treesitter/nvim-treesitter-context',
  },
  lazy = false,
  build = ':TSUpdate'
}
