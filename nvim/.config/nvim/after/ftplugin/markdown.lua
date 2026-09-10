vim.opt.shiftwidth = 2
-- vim.opt.textwidth = 80
-- vim.opt.wrapmargin = 0
vim.opt.linebreak = true

-- Define preferred link color (Dracula Cyan)
local link_color = "#8be9fd"

-- Highlight groups for Markdown links
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

-- Apply foreground color to each group
for _, group in ipairs(link_groups) do
  vim.api.nvim_set_hl(0, group, { fg = link_color, underline = true })
end
