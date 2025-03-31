return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup({
      default_file_explorer = false
    })
  end
}
