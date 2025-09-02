return {
  'Mofiqul/dracula.nvim',
  config = function()
    local dracula = require("dracula")

    dracula.setup({
      -- customize dracula color palette
      colors = {
        bg = "#282A36",
        fg = "#F8F8F2",
        selection = "#44475A",
        comment = "#6272A4",
        red = "#FF5555",
        orange = "#FFB86C",
        yellow = "#F1FA8C",
        green = "#50fa7b",
        purple = "#BD93F9",
        cyan = "#8BE9FD",
        pink = "#FF79C6",
        bright_red = "#FF6E6E",
        bright_green = "#69FF94",
        bright_yellow = "#FFFFA5",
        bright_blue = "#D6ACFF",
        bright_magenta = "#FF92DF",
        bright_cyan = "#A4FFFF",
        bright_white = "#FFFFFF",
        menu = "#21222C",
        visual = "#3E4452",
        gutter_fg = "#4B5263",
        nontext = "#3B4048",
        white = "#ABB2BF",
        black = "#191A21",
      },
      show_end_of_buffer = true, -- default false
      transparent_bg = true, -- default false
      -- lualine_bg_color = "#282A36", -- default nil
      -- set italic comment
      italic_comment = true, -- default false
      -- overrides the default highlights with table see `:h synIDattr`
      overrides = {
        LineNrAbove = { fg = "#6272A4" },
        LineNr= { fg = "#6272A4" },
        LineNrBelow = { fg = "#6272A4" },

        mkdBlockquote = { fg = "#F1FA8C" },

        WinSeparator = { fg = "#FFB86C" }
      },
    })

    vim.cmd('colorscheme dracula')

    vim.api.nvim_create_autocmd("TextYankPost", {
      pattern = "*",
      callback = function(_)
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 75 })
      end,
    })
  end
}

