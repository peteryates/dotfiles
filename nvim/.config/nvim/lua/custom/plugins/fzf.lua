return {
  {
    'ibhagwan/fzf-lua',
    config = function()
      require("fzf-lua").setup({
        'fzf-native',
        file_icons = false,
        fzf_opts =  {['--layout'] = 'default'}
      })
      vim.keymap.set({'n'}, '<Leader>t', ':FzfLua files<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>T', ':FzfLua grep<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>b', ':FzfLua buffers<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>l', ':FzfLua blines<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>L', ':FzfLua lines<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>h', ':FzfLua git_bcommits<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>H', ':FzfLua git_commits<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>s', ':FzfLua spell_suggest<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>r', ':FzfLua lsp_references<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>g', ':FzfLua grep_project<CR>', {expr = false, noremap = true, silent = true})
      vim.keymap.set({'n'}, '<Leader>G', ':FzfLua grep_cWORD<CR>', {expr = false, noremap = true, silent = true})
    end
  }
}
