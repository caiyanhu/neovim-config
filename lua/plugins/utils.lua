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
		"stevearc/conform.nvim",
		cond = not vim.g.vscode,
		event = "VeryLazy",
		config = function()
			local langs_use_prettier = {
				"css",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"less",
				"typescript",
				"typescriptreact",
				"vue",
			}
			local formatters = {}
			for key, _ in pairs(langs_use_prettier) do
				formatters[key] = { "prettier" }
			end
			formatters["lua"] = { "stylua" }
			formatters["rust"] = { "rustfmt" }
			formatters["yaml"] = { "yamlfix" }
			require("conform").setup({
				formatters_by_ft = formatters,
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		cond = not vim.g.vscode,
		event = "VeryLazy",
		config = function()
			local linters = {
				css = { "stylelint" },
				javascript = { "eslint" },
				typescript = { "eslint" },
				typescriptreact = { "stylelint", "eslint" },
			}
			local languages = {
				"css",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"lua",
				"rust",
				"typescript",
				"typescriptreact",
				"vue",
			}
			for _, name in pairs(languages) do
				if not linters[name] then
					linters[name] = { "cspell" }
				end
				if not vim.tbl_contains(linters[name], "cspell") then
					table.insert(linters[name], "cspell")
				end
			end
			require("lint").linters_by_ft = linters
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
