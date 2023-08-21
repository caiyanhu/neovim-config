return {
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
		"mfussenegger/nvim-lint",
		cond = not vim.g.vscode,
		event = "VeryLazy",
		config = function()
			local lint = require("lint")
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				desc = "nvim-lint",
				callback = function()
					local linters = lint.linters_by_ft[vim.bo.filetype]
					if not linters then
						linters = {}
						lint.linters_by_ft[vim.bo.filetype] = linters
					end
					if not vim.tbl_contains(linters, "cspell") then
						table.insert(linters, "cspell")
					end
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"mhartington/formatter.nvim",
		event = "VeryLazy",
		config = function()
			-- set keymaps
			vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>:Format<cr>", { noremap = true, silent = true })
			-- Format after save
			vim.cmd([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost * FormatWrite
        augroup END
      ]])
			local fts_use_prettier = {
				"css",
				"html",
				"javascript",
				"json",
				"typescript",
				"typescriptreact",
				"vue",
				"yaml",
			}
			local filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			}
			for _, ft_name in ipairs(fts_use_prettier) do
				filetype[ft_name] = {
					require("formatter.filetypes." .. ft_name).prettier,
				}
			end
			require("formatter").setup({
				logging = false,
				filetype = filetype,
			})
		end,
	},
}
