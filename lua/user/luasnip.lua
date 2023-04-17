local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

local tsreact = "typescriptreact"
local ts = "typescript"

local get_filename = function()
	print(vim.fn.expand("%:t:r"))
	return vim.fn.expand("%:t:r")
end

ls.add_snippets(tsreact, {
	s("react_fc_1", {
		t("interface "),
		f(get_filename, {}),
		t({ "Props {", "    " }),
		i(0),
		t({ "", "}", "", "export const " }),
		f(get_filename, {}),
		-- t({ " = ({}: ) => {", "    return (", "        <div></div>", "    )", "}" }),
		t(" = ({}: "),
		f(get_filename, {}),
		t({ "Props ) => {", "    return (", "        <div></div>", "    )", "}" }),
	}),
	s("react_fc_2", {
		t("export const "),
		f(get_filename, {}),
		t({ " = () => {", "    return <div>" }),
		i(0),
		t({ "</div>;", "};" }),
		-- t({ "export const " }),
		-- f(get_filename, {}),
		-- -- t({ " = ({}: ) => {", "    return (", "        <div></div>", "    )", "}" }),
		-- t(" = () => {"),
		-- f(get_filename, {}),
		-- t({ "Props ) => {", "    return (", "        <div></div>", "    )", "}" }),
	}),
	s("comment", {
		t({ "{/**", "" }),
		i(0),
		t({ "", "*/}" }),
	}),
	s(".", {
		t('<div className="'),
		i(0),
		t('">'),
		i(1),
		t("</div>"),
	}),
	s(".", {
		t("<div>"),
		i(0),
		t("</div>"),
	}),
	s("int", {
		t("interface "),
		i(1),
		t({ " {", "    " }),
		i(0),
		t({ "", "}" }),
	}),
})

ls.add_snippets(ts, {
	s("fn", {
		t("export const "),
		f(get_filename, {}),
		t(" = ("),
		i(0),
		t(") => {}"),
	}),
	s("int", {
		t("interface "),
		i(1),
		t({ " {", "    " }),
		i(0),
		t({ "", "}" }),
	}),
})
