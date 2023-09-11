return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
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
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 300,
				},
			})
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("illuminate").configure()
		end,
	},
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"jcdickinson/codeium.nvim",
		event = { "InsertEnter" },
		cond = not vim.g.vscode,
		config = function()
			require("codeium").setup({})
		end,
	},
	{
		"stevearc/conform.nvim",
		cond = not vim.g.vscode,
		event = { "BufWritePost", "BufReadPost" },
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
				"yaml",
			}
			local formatters = {}
			for _, name in pairs(langs_use_prettier) do
				formatters[name] = { "prettier" }
			end
			formatters["lua"] = { "stylua" }
			formatters["rust"] = { "rustfmt" }
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
		event = { "BufWritePost", "BufReadPost" },
		config = function()
			local linters = {
				css = { "stylelint" },
				javascript = { "eslint" },
				typescript = { "eslint" },
				typescriptreact = { "eslint" },
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
	{
		"ggandor/flit.nvim",
		enabled = true,
		keys = function()
			local ret = {}
			for _, key in ipairs({ "f", "F", "t", "T" }) do
				ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
			end
			return ret
		end,
		dependencies = { "ggandor/leap.nvim" },
		opts = { labeled_modes = "nx" },
	},
}
