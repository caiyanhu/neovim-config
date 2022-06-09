local luasnip_status_ok, ls = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function()
	return { os.date("%Y-%m-%d") }
end

ls.add_snippets(nil, {
	all = {
		snip({
			trig = "date",
			namr = "Date",
			dscr = "Date in the form of YYYY-MM-DD",
		}, {
			func(date, {}),
		}),
	},
	typescript = {
		snip("clg", {
			text("console.log("),
			insert(0),
			text(")"),
		}),
		snip("trycatch", {
			text("try {"),
			text("\t"),
			insert(0),
			text("}catch(error){"),
			text("\t"),
			insert(1),
			text("}"),
		}),
	},
	javascript = {
		snip("clg", {
			text("console.log("),
			insert(0),
			text(")"),
		}),
	},
})
