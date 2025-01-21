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
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'snippets', 'emoji', 'lsp', 'path', 'buffer' },
        providers = {
          snippets = {
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
          markdown = {
            name = 'RenderMarkdown',
            module = 'render-markdown.integ.blink',
            fallbacks = { 'lsp' }
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
