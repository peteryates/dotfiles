-- an attempt to solve a problem where sometimes when tabbing the
-- cursor jumps to a random spot.
-- Pulled from https://github.com/L3MON4D3/LuaSnip/issues/258
function LeaveSnippet()
    if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
        require('luasnip').unlink_current()
    end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua LeaveSnippet()
]])
