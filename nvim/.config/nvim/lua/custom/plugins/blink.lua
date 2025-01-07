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
      { 'moyiz/blink-emoji.nvim' },
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
        default = { 'luasnip', 'emoji', 'lsp', 'path', 'buffer' },
        providers = {
          luasnip = {
             score_offset = 1000

          },
          lsp = {
             score_offset = 800
          },
          emoji = {
            module = 'blink-emoji',
            name = 'Emoji',
            score_offset = 600,
            opts = { insert = true },
          },
        }
      },
      signature = { enabled = true },
      keymap = {
        ['<C-s>'] = { 'select_and_accept' },
      }
    },
  }
}
