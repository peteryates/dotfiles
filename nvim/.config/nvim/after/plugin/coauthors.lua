local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

local coauthors = dofile('/home/peter/.secrets/neovim/coauthors.lua')
local snippets = {}

for _, author in ipairs(coauthors) do
  table.insert(snippets, s(author.trigger, t("Co-authored-by: " .. author.name .. " <" .. author.email .. ">")))
end

ls.add_snippets("gitcommit", snippets)
