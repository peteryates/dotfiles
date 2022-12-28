require('mason').setup()

local servers = { 'solargraph', 'tsserver', 'sumneko_lua', 'yamlls', 'jsonls' }

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
lspconfig.solargraph.setup({})
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



-- require("mason").setup()
--
-- require("lspconfig").vimls.setup({})
-- require("lspconfig").yamlls.setup({})
-- require("lspconfig").solargraph.setup({})
-- require("lspconfig").crystalline.setup({})
-- require("luasnip").filetype_extend("ruby", {"rails"})
--
-- local lsp_formatting = function(bufnr)
--   vim.lsp.buf.format({
--     filter = function(client)
--       -- apply whatever logic you want (in this example, we'll only use null-ls)
--       return client.name == "null-ls"
--     end,
--     bufnr = bufnr,
--   })
-- end
--
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- -- add to your shared on_attach callback
-- local on_attach = function(client, bufnr)
--   if client.supports_method("textDocument/formatting") then
--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         lsp_formatting(bufnr)
--       end,
--     })
--   end
-- end
--
-- local css_capabilities = vim.lsp.protocol.make_client_capabilities()
-- css_capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- require("lspconfig").cssls.setup {
--   capabilities = css_capabilities,
-- }
--
-- require("lspconfig").tsserver.setup({
--   on_attach = on_attach
-- })
--
-- local html_capabilities = vim.lsp.protocol.make_client_capabilities()
-- html_capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- require("lspconfig").html.setup {
--   capabilities = html_capabilities,
--   filetypes = { "html", "eruby" }
-- }
--
-- local library = {}
-- local path = vim.split(package.path, ";")
--
-- require("lspconfig").sumneko_lua.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         version = "LuaJIT",
--         path = path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         libary = library,
--       },
--     },
--   },
-- }
--
-- require("luasnip/loaders/from_vscode").lazy_load()
--
-- local cmp = require('cmp')
-- local compare = require('cmp.config.compare')
-- local mapping = require('cmp.config.mapping')
-- local types = require('cmp.types')
-- local luasnip = require('luasnip')
--
-- cmp.setup({
--   enabled = function()
--     return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
--   end,
--   completion = {
--     autocomplete = {
--       types.cmp.TriggerEvent.TextChanged,
--     },
--     completeopt = 'menu,menuone,noselect',
--     keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
--     keyword_length = 4,
--     get_trigger_characters = function(trigger_characters)
--       return trigger_characters
--     end,
--   },
--
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--
--   preselect = types.cmp.PreselectMode.Item,
--
--   window = {
--     completion = cmp.config.window.bordered(),
--     documentation = cmp.config.window.bordered(),
--   },
--
--   indent = {
--     enable = true,
--   },
--
--   confirmation = {
--     default_behavior = types.cmp.ConfirmBehavior.Insert,
--     get_commit_characters = function(commit_characters)
--       return commit_characters
--     end,
--   },
--
--   sorting = {
--     priority_weight = 2,
--     comparators = {
--       compare.offset,
--       compare.exact,
--       compare.score,
--       compare.recently_used,
--       compare.kind,
--       compare.sort_text,
--       compare.length,
--       compare.order,
--     },
--   },
--
--   event = {},
--
--   mapping = {
--
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--
--     ["<S-Tab>"] = cmp.mapping(function(fallback)
--       if luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--
--     ['<C-n>'] = mapping(mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
--     ['<C-p>'] = mapping(mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
--     ['<C-y>'] = mapping.confirm({ select = false }),
--     ['<C-e>'] = mapping.abort(),
--   },
--
--   format = {
--     fields = { 'abbr', 'kind', 'menu' },
--     format = function(_, vim_item)
--       return vim_item
--     end,
--   },
--
--   view = {
--     entries = 'native',
--   },
--
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'nvim_lua' },
--     { name = 'path' },
--     -- { name = 'luasnip', option = { show_autosnippets = false } },
--     { name = 'emoji' },
--     { name = 'buffer', keyword_length = 5, max_item_count = 10 },
--   },
-- })
