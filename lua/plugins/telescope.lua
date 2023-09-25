return {
	{
		"nvim-telescope/telescope.nvim",
		cond = not vim.g.vscode,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = jit.os == "OSX" and "make"
					or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		keys = {
			{ "<leader>?", "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
			{ "<leader><space>", "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<cr>" },
			{
				"<leader>/",
				function()
					-- find in current buffer
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
			},
			{ "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
			{ "<leader>ff", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>" },
			{ "<leader>gc", "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>" },
		},
		config = function()
			local lga_actions = require("telescope-live-grep-args.actions")
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						mappings = {
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
								["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							},
						},
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("live_grep_args")
		end,
	},
}
