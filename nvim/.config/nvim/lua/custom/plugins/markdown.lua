return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    checkbox = {
      enabled = true,
      checked = {
        icon = ' '
      },
      unchecked = {
        icon = ' '
      }
    },
    code = {
      -- Turn on / off code block & inline code rendering.
      enabled = true,
      -- Additional modes to render code blocks.
      render_modes = true,
      -- Turn on / off sign column related rendering.
      sign = true,
      -- Whether to conceal nodes at the top and bottom of code blocks.
      conceal_delimiters = true,
      language = true,
      disable_background = true,
      position = 'left',
      width = 'full',
      style = 'full',
    },
  },
}
