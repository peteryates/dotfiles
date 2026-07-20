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
    }
  },
  config = function()
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
    vim.lsp.config('biome', {
      cmd = { 'biome', 'lsp-proxy' },
      filetypes = { 'javascript', 'typescript', 'json', 'jsonc', 'css' },
      -- root_markers = { 'package.json', '.git' },
      root_markers = { '.git', '' },
    })

    vim.lsp.config('tflint', {})
    vim.lsp.config('herb_ls', {})
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
      'biome',
      'cssls',
      'herb_ls',
      'lua_ls',
      'ruby_lsp',
      'solargraph',
      'terraformls',
      'tflint',
      'yamlls'
    })
  end
}
