lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "ruby", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
  rainbow = {
    enable = true,
    -- extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    colors = { "#bf616a", "#d08770", "#ebcb8b", "#a3be8c", "#b48ead", "#8fbcbb", "#88c0d0" }, -- table of hex strings
    -- termcolors = {}, -- table of colour name strings
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    -- disable = { "python" },  -- optional, list of language that will be disabled
  },
}
EOF

highlight link TSError Normal

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=5
