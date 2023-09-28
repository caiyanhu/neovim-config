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
	{
		"numToStr/FTerm.nvim",
		keys = {
			{
				"<A-`>",
				function()
					require("FTerm").toggle()
				end,
			},
			{
				"<A-`>",
				"<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>",
				mode = "t",
			},
		},
		opts = {},
	},
}
