if vim.fn.exists("g:vscode") ~= 0 then
	-- VSCode extension
	require("user.options")
	require("user.keymaps")
else
	require("user.options")
	require("user.keymaps")
	require("user.plugins")
	require("user.lsp")
	require("user.dressing")
	require("user.telescope")
	require("user.colorscheme")
	require("user.cmp")
	require("user.ale")
	require("user.treesitter")
	require("user.autopairs")
	require("user.ts-autotag")
	require("user.comment")
	require("user.gitsigns")
	require("user.nvim-tree")
	require("user.lualine")
	require("user.colorizer")
	require("user.snippets")
	require("user.ufo")
	require("user.bookmarks")
	require("user.todo-comments")
	require("user.diffview")
	require("user.last-place")
	require("user.muren")
end
