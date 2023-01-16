local lua_snip_status_ok, ls = pcall(require, "luasnip")
if not lua_snip_status_ok then
	return
end
-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local LUA_Snip = {
	s({
		trig = "req",
		dscr = "require module",
	}, {
		t("require('"),
		i(1, "Module-name"),
		t("')"),
		i(0),
	}),
}

local JS_Snip = {
	s({
		trig = "clg",
		dscr = "console log",
	}, {
		t("console.log("),
		i(0),
		t(");"),
	}),
	s({
		trig = "edf",
		dscr = "export default",
	}, {
		t("export default "),
		i(0),
	}),
	s({
		trig = "de",
		dscr = "debugger",
	}, {
		t("debugger;"),
	}),
}
ls.add_snippets(nil, {
	lua = LUA_Snip,
	typescript = JS_Snip,
	javascript = JS_Snip,
})
