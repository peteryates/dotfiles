require('mason').setup()

local servers = { 'tsserver', 'lua_ls', 'yamlls', 'jsonls' }

-- Enable lsp lines
require("lsp_lines").setup()

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Turn on lsp status information
require('fidget').setup()

-- Ensure solargraph is configured

local lspconfig = require("lspconfig")
lspconfig.solargraph.setup({
  solargraph = {
    useBundler = true
  }
})
lspconfig.yamlls.setup({})

local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.filetype_extend("ruby", {"rails"})

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      -- if cmp.visible() then
      --   cmp.select_next_item()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      -- if cmp.visible() then
      --   cmp.select_prev_item()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'emoji', insert = true },
    { name = 'buffer', keyword_length = 5, max_item_count = 10 },
  },
}

vim.keymap.set(
  "",
  "<Leader>d",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)
