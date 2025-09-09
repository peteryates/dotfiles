local ls = require('luasnip')

require("luasnip/loaders/from_vscode").lazy_load()

-- some shorthands...
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local c = ls.choice_node
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

vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

ls.add_snippets(
  "ruby",
  {
    s({ trig = "it", dscr = "RSpec 'it' snippet" }, {
      c(1, {
        fmt(
          [[
            it '{}' do
              {}
            end
          ]], { i(1, 'scenario name'), i(2, 'test case') }
        ),
        fmt(
          [[
            it {{ {} }}
          ]], { i(1, 'test case') }
        ),
        fmt(
          [[
            scenario '{}' do
              {}
            end
          ]], { i(1, 'scenario name'), i(2, 'test case') }
        ),
      }),
    }),
    s("ri", fmt("render_inline({})", { i(1, "component") })),
    -- Snippet for FactoryBot.create and FactoryBot.build
    s("fb", {
        t("FactoryBot."),
        c(1, {
          t("create"),
          t("build"),
        }),
        t("("),
        i(2, "user"),
        t(", "),
        i(3, "attributes"),
        t(")"),
    }),
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
