return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			char = "│",
			filetype_exclude = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		config = true,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"MattesGroeger/vim-bookmarks",
		event = { "BufWritePost", "BufReadPost" },
		config = function()
			-- vim.g.bookmark_sign = "💙"
			-- vim.g.bookmark_sign = "♥"
			-- vim.g.bookmark_sign = "⚑"
			-- vim.g.bookmark_sign = "🐯"
			-- vim.g.bookmark_sign = "🚩"
			-- vim.g.bookmark_sign = "🎀"
			-- vim.g.bookmark_sign = "🔵"
			-- vim.g.bookmark_sign = "🔥"
			-- vim.g.bookmark_sign = "⭐"
			vim.g.bookmark_sign = "🎯"
			vim.g.bookmark_highlight_lines = 1
			vim.cmd([[ highlight BookmarkSign ctermbg=NONE ctermfg=160 ]])
			vim.cmd([[ highlight BookmarkLine ctermbg=194 ctermfg=NONE ]])
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		version = false,
		config = true,
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		version = false,
		config = true,
	},
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		version = false,
		config = true,
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
	},
}
