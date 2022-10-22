local status_ok, lint = pcall(require, "lint")
if not status_ok then
	return
end

lint.linters_by_ft = {
	javascript = { "eslint" },
	typescript = { "eslint" },
	javascriptreact = { "eslint" },
	typescriptreact = { "eslint" },
	json = { "eslint" },
	vue = { "eslint" },
	css = { "stylelint" },
	sass = { "stylelint" },
	scss = { "stylelint" },
	less = { "stylelint" },
	lua = { "luacheck" },
}
