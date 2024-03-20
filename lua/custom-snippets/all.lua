local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
-- some shorthands...

ls.add_snippets(nil, {
	go = {
		-- Println snippet
		s("gp", {
			t({ "fmt.Println(" }),
			i(0),
			t({ ")" }),
		}),
		-- err != nil snippet
		s("ge", {
			t({ "if err != nil {", "" }),
			i(0),
			t({ "\treturn err", "" }),
			t({ "}" }),
		}),
		-- go variable declaration
		s("gv", {
			i(1),
			t({ " := " }),
			i(2),
		}),
	},
})
