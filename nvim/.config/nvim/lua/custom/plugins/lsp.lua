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

    vim.lsp.config('lua_ls', {})
    vim.lsp.config('solargraph', {
      filetypes = { "ruby" },
      formatting = true,
      command = { 'rbenv', 'exec', 'solargraph', 'stdio' },
      settings = {
        folding = true,
        rename = true,
        symbols = true,
        autoformat = true,
        diagnostic = true,
      }
    })
    vim.lsp.config('terraformls', {})
    vim.lsp.config('ts_ls', {
        module = "commonjs",
        target = "es6",
        checkJs = false,
        exclude = {
          "node_modules"
        }
    })
    vim.lsp.config('tflint', {})
    vim.lsp.config('cssls', {
      settings = {
        css = {
          validate = true
        },
        less = {
          validate = true
        },
        scss = {
          validate = true
        }
      }
    })
    vim.lsp.config('herb_ls', {})
    -- vim.lsp.config('rubocop', {
    --   command = "bundle",
    --   args = { "exec", "rubocop", "--lsp" }
    -- })
    -- vim.lsp.config('ruby_lsp', {
    --   cmd = { 'rbenv', 'exec', 'ruby-lsp' },
    --   init_options = {
    --     addonSettings = {
    --       ["Ruby LSP Rails"] = {
    --         enablePendingMigrationsPrompt = false
    --       }
    --     }
    --   }
    -- })
    vim.lsp.config('yamlls', {
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

    vim.lsp.enable({
      'solargraph',
      'lua_ls',
      'tflint',
      'cssls',
      'terraformls',
      'ruby_lsp',
      'yamlls',
      'herb_ls'
    })
  end
}
