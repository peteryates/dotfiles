local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

require("lspconfig").vimls.setup({})
require("lspconfig").yamlls.setup({})
require("lspconfig").solargraph.setup({})
require("lspconfig").crystalline.setup({})
require("luasnip").filetype_extend("ruby", {"rails"})

local css_capabilities = vim.lsp.protocol.make_client_capabilities()
css_capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup {
  capabilities = css_capabilities,
}

require("lspconfig").tsserver.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end,
})

local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup {
  capabilities = html_capabilities,
  filetypes = { "html", "eruby" }
}

local library = {}
local path = vim.split(package.path, ";")

require("lspconfig").sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        libary = library,
      },
    },
  },
}

require("luasnip/loaders/from_vscode").lazy_load()

local cmp = require('cmp')
local compare = require('cmp.config.compare')
local mapping = require('cmp.config.mapping')
local types = require('cmp.types')
local luasnip = require('luasnip')

cmp.setup({
  enabled = function()
    return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
  end,
  completion = {
    autocomplete = {
      types.cmp.TriggerEvent.TextChanged,
    },
    completeopt = 'menu,menuone,noselect',
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 2,
    get_trigger_characters = function(trigger_characters)
      return trigger_characters
    end,
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  preselect = types.cmp.PreselectMode.Item,

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  indent = {
    enable = true,
  },

  confirmation = {
    default_behavior = types.cmp.ConfirmBehavior.Insert,
    get_commit_characters = function(commit_characters)
      return commit_characters
    end,
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },

  event = {},

  mapping = {

    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<C-n>'] = mapping(mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
    ['<C-p>'] = mapping(mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
    ['<C-y>'] = mapping.confirm({ select = false }),
    ['<C-e>'] = mapping.abort(),
  },

  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = function(_, vim_item)
      return vim_item
    end,
  },

  view = {
    entries = 'native',
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'emoji' },
    { name = 'buffer', keyword_length = 5, max_item_count = 10 },
  },
})
