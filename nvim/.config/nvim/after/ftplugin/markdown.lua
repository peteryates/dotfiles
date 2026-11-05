vim.opt.shiftwidth = 2
-- vim.opt.textwidth = 80
-- vim.opt.wrapmargin = 0
vim.opt.linebreak = true

local link_color = "#8be9fd"

-- Links

local link_groups = {
  "markdownLinkText",
  "markdownUrl",
  "htmlLink",
  "@markup.link.label",
  "@markup.link.url",
  "@markup.link.label.markdown_inline",
  "@markup.link.url.markdown_inline",
  "@text.reference", -- Legacy Treesitter
  "@text.uri",       -- Legacy Treesitter
}

for _, group in ipairs(link_groups) do
  vim.api.nvim_set_hl(0, group, { fg = link_color, underline = true })
end

-- Checkboxes

local not_done_color = "#ff5555"
local done_color = "#50fa7b"

vim.api.nvim_set_hl(0, 'RenderMarkdownUnchecked', { fg = not_done_color })
vim.api.nvim_set_hl(0, 'RenderMarkdownChecked', { fg = done_color })
