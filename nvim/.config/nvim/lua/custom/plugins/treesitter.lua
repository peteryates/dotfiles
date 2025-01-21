-- local M = {
--   "nvim-treesitter/nvim-treesitter",
--   build = ":TSUpdate",
--   branch = "main",
--   lazy = false,
--   -- config = function()
--   --   require("custom.treesitter").setup()
--   -- end,
-- }
-- return { M }

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'Wansmer/treesj',
    'nvim-treesitter/nvim-treesitter-context',
  },
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "ruby", "javascript", "html", "markdown", "markdown_inline" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true, disable = { "ruby" } },
    })

    local tsj = require('treesj')
    tsj.setup({
      use_default_keymaps = true,
      check_syntax_error = true,
      max_join_length = 200,
      cursor_behavior = 'hold',
      notify = true,
      langs = {},
      dot_repeat = true,
    })

    vim.keymap.set('n', 'gS', require('treesj').split)
    vim.keymap.set('n', 'gJ', require('treesj').join)

    local colors = require('dracula').colors()

    vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { bg = colors['selection'] })
    vim.api.nvim_set_hl(0, 'TreesitterContextLineNumberBottom', { bg = colors['selection'] })
  end
}
