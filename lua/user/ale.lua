-- only run linters named in ale_linters settings
vim.g.ale_linters_explicit = 1

-- linters
vim.g.ale_linters = {
	css = { "stylint", "vscode-css-language-server", "cspell" },
	html = { "cspell" },
	javascript = { "tsserver", "eslint", "cspell" },
	javascriptreact = { "stylint", "vscode-css-language-server", "eslint", "cspell" },
	json = { "vscode-json-language-server", "cspell" },
	lua = { "selene", "cspell" },
	rust = { "analyzer", "cspell" },
	typescript = { "tsserver", "eslint", "cspell" },
	typescriptreact = { "stylint", "vscode-css-language-server", "eslint", "cspell" },
	vue = { "volar", "cspell" },
}

-- fixers
vim.g.ale_fixers = {
	css = { "prettier" },
	html = { "prettier" },
	javascript = { "prettier" },
	javascriptreact = { "prettier" },
	json = { "prettier" },
	lua = { "stylua" },
	rust = { "rustfmt" },
	typescript = { "prettier" },
	typescriptreact = { "prettier" },
	vue = { "prettier" },
}

vim.g.ale_fix_on_save = 0

-- change the signs ALE use
vim.g.ale_sign_error = "🔴"
vim.g.ale_sign_warning = "🟡"
vim.cmd([[ highlight clear ALEErrorSign ]])
vim.cmd([[ highlight clear ALEWarningSign ]])
