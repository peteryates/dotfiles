return {
  {
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
      { 'l3mon4d3/luasnip', version = 'v2.*' },
      { 'rafamadriz/friendly-snippets' },
    },
    opts = {
      snippets = {
        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction) require('luasnip').jump(direction) end,
      },
      sources = {
        default = { 'luasnip', 'lsp', 'path', 'buffer' },
        providers = {
          lsp = {
             score_offset = -5
          }
        }
      },
      signature = { enabled = true },
      keymap = {
        ['<C-s>'] = { 'select_and_accept' },
      }
    },
  }
}
