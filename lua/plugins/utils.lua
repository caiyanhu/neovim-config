return {
	{
		"rhysd/accelerated-jk",
		keys = {
			{ "j", "<Plug>(accelerated_jk_gj)" },
			{ "k", "<Plug>(accelerated_jk_gk)" },
		},
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
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>e",
				"<cmd>Neotree toggle<CR>",
				desc = "Open the neo-tree",
				mode = { "n", "v" },
			},
		},
		config = true,
	},
	{
		"jcdickinson/codeium.nvim",
		event = "VeryLazy",
		config = function()
			require("codeium").setup({})
		end,
	},
	{
		"vladdoster/remember.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"dense-analysis/ale",
		event = "VeryLazy",
		config = function()
			-- linters
			vim.g.ale_linters = {
				css = { "stylelint", "vscode-css-language-server", "cspell" },
				html = { "cspell" },
				javascript = { "tsserver", "eslint", "cspell" },
				javascriptreact = { "stylelint", "vscode-css-language-server", "eslint", "cspell" },
				json = { "vscode-json-language-server", "cspell" },
				lua = { "cspell" },
				rust = { "analyzer", "cspell" },
				typescript = { "tsserver", "eslint", "cspell" },
				typescriptreact = { "stylelint", "vscode-css-language-server", "eslint", "cspell" },
				vue = { "volar", "cspell" },
			}

			-- fixers
			vim.g.ale_fixers = {
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				less = { "prettier" },
				lua = { "stylua" },
				rust = { "rustfmt" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				vue = { "prettier" },
				yaml = { "yamlfix" },
				["*"] = { "remove_trailing_lines", "trim_whitespace" },
			}

			vim.g.ale_fix_on_save = 1
		end,
	},
}
