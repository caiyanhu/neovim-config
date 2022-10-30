local luasnip_status_ok, ls = pcall(require, "luasnip")
if not luasnip_status_ok then
  return
end
-- some shorthands...
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

local JS_Snip = {
  snip("clg", {
    text("console.log("),
    insert(0),
    text(")"),
  }),
  snip("edf", {
    text("export default "),
    insert(0),
  }),
  snip("cd", {
    text("console.dir("),
    insert(0),
    text(")"),
  }),
  snip("ce", {
    text("console.error("),
    insert(0),
    text(")"),
  }),
  snip("de", {
    text("debugger;"),
  }),
  snip("clg", {
    text("console.log("),
    insert(0),
    text(")"),
  }),
}

local LUA_Snip = {
  snip("shebang", {
    text({ "#!/usr/bin/lua", "", "" }),
    insert(0),
  }),
  snip("req", {
    text("require('"),
    insert(1, "Module-name"),
    text("')"),
    insert(0),
  }),
  snip("func", {
    text("function("),
    insert(1, "Arguments"),
    text({ ")", "\t" }),
    insert(2),
    text({ "", "end", "" }),
    insert(0),
  }),
  snip("forp", {
    text("for "),
    insert(1, "k"),
    text(", "),
    insert(2, "v"),
    text(" in pairs("),
    insert(3, "table"),
    text({ ") do", "\t" }),
    insert(4),
    text({ "", "end", "" }),
    insert(0),
  }),
  snip("fori", {
    text("for "),
    insert(1, "k"),
    text(", "),
    insert(2, "v"),
    text(" in ipairs("),
    insert(3, "table"),
    text({ ") do", "\t" }),
    insert(4),
    text({ "", "end", "" }),
    insert(0),
  }),
  snip("if", {
    text("if "),
    insert(1),
    text({ " then", "\t" }),
    insert(2),
    text({ "", "end", "" }),
    insert(0),
  }),
  snip("M", {
    text({ "local M = {}", "", "" }),
    insert(0),
    text({ "", "", "return M" }),
  }),
}

ls.add_snippets(nil, {
  lua = LUA_Snip,
  typescript = JS_Snip,
  javascript = JS_Snip,
})
