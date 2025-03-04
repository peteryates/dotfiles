return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        }
      },
    },
    { "williamboman/mason.nvim" }
  },
  config = function()
    require("mason").setup({})
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({})
    lspconfig.solargraph.setup({
      filetypes = { "ruby" },
      formatting = true,
      command = { 'rbenv', 'exec', 'solargraph', 'stdio' },
      settings = {
        folding = true,
        rename = true,
        symbols = true,
        autoformat = true,
      }
    })
    lspconfig.terraformls.setup({})
    lspconfig.ts_ls.setup({})
    lspconfig.cssls.setup({})
    lspconfig.rubocop.setup({})
    lspconfig.ruby_lsp.setup({})
  end
}
