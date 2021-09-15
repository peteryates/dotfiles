require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.solargraph.setup{}

local cmp = require('cmp')


local compare = require('cmp.config.compare')
local types = require('cmp.types')

local WIDE_HEIGHT = 40

---@return cmp.ConfigSchema
cmp.setup {
  enabled = function()
    return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
  end,
  completion = {
    autocomplete = {
      types.cmp.TriggerEvent.TextChanged,
    },
    completeopt = 'menu,menuone,noselect',
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 1,
    get_trigger_characters = function(trigger_characters)
      return trigger_characters
    end,
  },

  snippet = {
    expand = function()
      error('snippet engine is not configured.')
    end,
  },

  preselect = types.cmp.PreselectMode.Item,

  documentation = {
    border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
    winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
    maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
    maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
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
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },

  event = {},

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
  },

  formatting = {
    deprecated = true,
    format = function(_, vim_item)
      return vim_item
    end,
  },

  experimental = {
    ghost_text = false,
  },

  sources = {
    {name = 'buffer'},
    {name = 'nvim_lsp'},
    {name = "ultisnips"},
    {name = "nvim_lua"},
    {name = "path"},
    {name = "emoji"}
  },
}
