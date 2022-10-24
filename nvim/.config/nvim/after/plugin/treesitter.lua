local dracula = { "#8be9fd", "#50fa7b", "#ffb86c", "#ff79c6", "#bd93f9", "#ff5555", "#f1fa8c" }

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "ruby",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
  },
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  rainbow = {
    enable = true,
    -- extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    colors = dracula,
    termcolors = dracula,
  },
  highlight = {
    additional_vim_regex_highlighting = {"markdown"},
  },
}

-- workaround for not being able to set colors using the
-- config above https://github.com/p00f/nvim-ts-rainbow/issues/81
for i, c in ipairs(dracula) do
  vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
end

require'treesitter-context'.setup{}
