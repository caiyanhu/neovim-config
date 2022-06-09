-- global settings
require("user.options")
require("user.keymaps")

if vim.g.vscode then
	-- vscode extension
	-- map keyboard quickfix
	vim.api.nvim_set_keymap(
		"n",
		"z=",
		"<cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<Cr>",
		{ noremap = true, silent = true }
	)
else
	-- ordinary neovim
	require("user.plugins")
	require("user.colorscheme")
	require("user.cmp")
	require("user.lsp")
	require("user.ale")
	require("user.treesitter")
	require("user.autopairs")
	require("user.comment")
	require("user.gitsigns")
	require("user.nvim-tree")
	require("user.lualine")
	require("user.impatient")
	require("user.indentline")
	require("user.utils")
	require("user.floaterm")
	require("user.colorizer")
	require("user.snippets")
end
