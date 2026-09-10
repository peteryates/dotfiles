local fzf = require('fzf-lua')
local ls = require('luasnip')

local function list_emojis()
  local ok, emoji_snippets = pcall(require, 'luasnip-emoji')
  if not ok then
    vim.notify("nvim-luasnip-emoji is not installed!", vim.log.levels.ERROR)
    return
  end

  local entries = {}

  for _, snip in ipairs(emoji_snippets) do
    local trigger = snip.trigger
    local emoji = (snip.dscr and snip.dscr[1]) or ""
    local display_text = string.format("%s   %s", emoji, trigger)
    
    table.insert(entries, {
      display = display_text,
      snip = snip, -- Store the raw LuaSnip snippet object
    })
  end

  fzf.fzf_exec(function(cb)
    for _, entry in ipairs(entries) do
      cb(entry.display)
    end
    cb(nil)
  end, {
    prompt = "Emoji> ",
    actions = {
      ["default"] = function(selected)
        if not selected or #selected == 0 then return end
        
        for _, entry in ipairs(entries) do
          if entry.display == selected[1] then
            -- Trigger LuaSnip's expansion engine natively
            ls.snip_expand(entry.snip)
            break
          end
        end
      end,
    },
  })
end

vim.api.nvim_create_user_command('EmojiPicker', list_emojis, {})
vim.keymap.set('n', '<leader>E', list_emojis, { desc = 'Search Emoji (LuaSnip + fzf-lua)' })
