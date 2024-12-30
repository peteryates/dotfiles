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
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },
    })
  end
}
