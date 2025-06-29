local ls = require('luasnip')

require("luasnip/loaders/from_vscode").lazy_load()

-- some shorthands...
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")

ls.filetype_extend("ruby", { "rails" })

ls.add_snippets(
  "ruby",
  {
    s(
      "spec",
      fmt(
        [[
          specify "{}" do
            {}
          end
        ]], { i(1, "spec name"), i(0) })
    ),
    s(
      "scen",
      fmt(
        [[
          scenario "{}" do
            {}
          end
        ]], { i(1, "scenario name"), i(0) })
    ),
    s("ri", fmt("render_inline({})", { i(1, "component") })),
  }
)

ls.add_snippets(
  "markdown",
  {
    s(
      "li",
      fmt(
        [[* {}]], { i(1, "list item") })
    ),

    s(
      "cb",
      fmt(
        [[* [ ] {}]], { i(1, "task") })
    ),
  }
)

vim.keymap.set({ 'i', 's' }, '<M-f>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({"i", "s"}, "<M-n>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<M-p>", function() ls.jump(-1) end, {silent = true})
