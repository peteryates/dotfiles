return {
  'lewis6991/gitsigns.nvim',
  config = function()
    vim.o.signcolumn = 'yes:1'

    require('gitsigns').setup {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1500,
        ignore_whitespace = true,
      },
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        local gitsigns = require('gitsigns')
        map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal({']h', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal({'[h', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end)
      end
    }
  end
}
