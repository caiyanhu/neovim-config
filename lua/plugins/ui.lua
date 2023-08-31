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
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			--[[
      --    Old text                    Command         New text
      --------------------------------------------------------------------------------
      surr*ound_words             ysiw)           (surround_words)
      *make strings               ys$"            "make strings"
      [delete ar*ound me!]        ds]             delete around me!
      remove <b>HTML t*ags</b>    dst             remove HTML tags
      'change quot*es'            cs'"            "change quotes"
      <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
      delete(functi*on calls)     dsf             function calls
      --]]
			require("nvim-surround").setup()
		end,
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
