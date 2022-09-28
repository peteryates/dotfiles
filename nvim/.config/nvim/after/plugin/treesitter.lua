local dracula = { "#8be9fd", "#50fa7b", "#ffb86c", "#ff79c6", "#bd93f9", "#ff5555", "#f1fa8c" }

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "ruby",
      "yaml",
      "html",
      "css",
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
  -- indent = { enable = true },
  rainbow = {
    enable = true,
    -- extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    colors = dracula,
    termcolors = dracula,
  },
  endwise = {
      enable = true,
  },
}

-- workaround for not being able to set colors using the
-- config above https://github.com/p00f/nvim-ts-rainbow/issues/81
for i, c in ipairs(dracula) do
  vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
end

require'treesitter-context'.setup{}

vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
