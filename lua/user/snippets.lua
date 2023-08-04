-- load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

local status, luaSnip = pcall(require, "luasnip")
if not status then
	return
end

luaSnip.filetype_extend("typescript", { "javascript" })
