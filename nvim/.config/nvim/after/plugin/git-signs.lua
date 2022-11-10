vim.o.signcolumn = 'yes:1'

require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1500,
    ignore_whitespace = true,
  },
}
