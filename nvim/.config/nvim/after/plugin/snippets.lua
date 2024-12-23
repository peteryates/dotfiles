local ls = require("luasnip")
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
    "gitcommit",
    {
        s("ellie",   t("Co-authored-by: EllieNodder <94541493+EllieNodder@users.noreply.github.com>")),
        s("gemma",   t("Co-authored-by: gemmadallmandfe <87642394+gemmadallmandfe@users.noreply.github.com>")),
        s("hazel",   t("Co-authored-by: hazelyule <111048910+hazelyule@users.noreply.github.com>")),
        s("tony",    t("Co-authored-by: tonyheadford <tony@binarycircus.com>")),
        s("abeer",   t("Co-authored-by: cwrw <cwrw@users.noreply.github.com>")),
        s("naomi",   t("Co-authored-by: Lockyy <naomi@lockyy.com>")),
        s("frankie", t("Co-authored-by: Frankie Roberto <frankie@frankieroberto.com>")),
        s("rick",    t("Co-authored-by: Rick McVelia <rick.mcvelia@gmail.com>")),
        s("pablo",   t("Co-authored-by: Pablo Manrubia <pmanrubia@gmail.com>")),
        s("leo",     t("Co-authored-by: Leonidas Apostolidis <leoapost@users.noreply.github.com>")),
        s("claire",  t("Co-authored-by: claire-hughez <93539621+claire-hughez@users.noreply.github.com>")),
        s("rose",    t("Co-authored-by: Rose Asaf <rose.asaf@education.gov.uk>")),
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
