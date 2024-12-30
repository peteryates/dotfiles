return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup {
      ensure_installed = {
        "css-lsp",
        "lua-language-server",
        "prettier",
        "prettierd",
        "ruby_lsp",
        "solargraph",
        "terraform_ls",
      },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

    local lspconfig = require("lspconfig")

    lspconfig.ruby_lsp.setup({
      capabilities = capabilities,
    })

    lspconfig.solargraph.setup({
      capabilities = capabilities,
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

    lspconfig.lua_ls.setup({})

    lspconfig.cssls.setup({})
  end
}
