return {
	{
		"rhysd/accelerated-jk",
		cond = not vim.g.vscode,
		keys = {
			{ "j", "<Plug>(accelerated_jk_gj)" },
			{ "k", "<Plug>(accelerated_jk_gk)" },
		},
	},
	{
		"vladdoster/remember.nvim",
		cond = not vim.g.vscode,
		event = "VeryLazy",
		opts = {},
	},
}
