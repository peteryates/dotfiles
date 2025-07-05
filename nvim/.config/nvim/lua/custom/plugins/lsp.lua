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
    lspconfig.tflint.setup({})
    lspconfig.cssls.setup({})
    lspconfig.lua_ls.setup({})
    lspconfig.rubocop.setup({
      command = "bundle",
      args = { "exec", "rubocop", "--lsp" }
    })
    lspconfig.ruby_lsp.setup({
      cmd = { 'rbenv', 'exec', 'ruby-lsp' },
      init_options = {
        addonSettings = {
          ["Ruby LSP Rails"] = {
            enablePendingMigrationsPrompt = false
          }
        }
      }
    })
    lspconfig.yamlls.setup({
      settings = {
        yaml = {
          schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            ["../path/relative/to/file.yml"] = "/.github/workflows/*",
            ["/path/from/root/of/project"] = "/.github/workflows/*",
          }
        }
      }
    })
  end
}
