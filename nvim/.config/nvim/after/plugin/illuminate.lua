require('illuminate').configure({
  delay = 0,
  providers = {
    'lsp',
    'treesitter',
  },
  filetypes_denylist = {
    'fugitive',
  },
})

vim.api.nvim_set_hl(0, 'IlluminatedWordText', {underdotted=true})
