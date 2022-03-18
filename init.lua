vim.g.mapleader = " "

require("plugins")
require("keymappings")
require("settings")
local utils = require("utils")
require("language")

-- telescope command
utils.map("n", "<C-p>", ':lua require("telescope.builtin").find_files()<cr>')
utils.map("n", "<leader>f", ':lua require("telescope.builtin").live_grep()<cr>')
utils.map("n", "<leader>b", ':lua require("telescope.builtin").buffers()<cr>')
local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-u>"] = false,
			},
		},
	},
})

-- nvim-tree
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★",
		deleted = "",
		ignored = "◌",
	},
	folder = {
		arrow_open = "ᗐ",
		arrow_closed = "ᗒ",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
	lsp = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
}
utils.map("n", "<leader>e", ":NvimTreeToggle<CR>")
utils.map("n", "<leader>r", ":NvimTreeRefresh<CR>")
utils.map("v", "<leader>e", ":NvimTreeToggle<CR>")
utils.map("v", "<leader>r", ":NvimTreeRefresh<CR>")

-- git sign
vim.g.signify_sign_add = "+"
vim.g.signify_sign_delete = "_"
vim.g.signify_sign_delete_first_line = "‾"
vim.g.signify_sign_change = "~"

-- emmet
vim.g.user_emmet_mode = "a"
vim.g.user_emmet_leader_key = "<C-y>"

-- coc config
local function check_back_space()
	local col = vim.fn.col(".") - 1
	return col <= 0 or vim.fn.getline("."):sub(col, col):match("%s")
end
function tab_completion()
	if vim.fn.pumvisible() > 0 then
		return utils.esc("<C-n>")
	end
	if check_back_space() then
		return utils.esc("<TAB>")
	end
	return vim.fn["coc#refresh"]()
end
utils.map("i", "<TAB>", "v:lua.tab_completion()", { expr = true, noremap = false })
utils.map("i", "<S-TAB>", 'pumvisible() ? "<C-p>" : "<S-TAB>"', { expr = true, noremap = false })

-- Auto Pairs
local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")
npairs.setup({ map_bs = false, map_cr = false })
vim.g.coq_settings = { keymap = { recommended = false } }
remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
_G.MUtils = {}
MUtils.CR = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ "selected" }).selected ~= -1 then
			return npairs.esc("<c-y>")
		else
			return npairs.esc("<c-e>") .. npairs.autopairs_cr()
		end
	else
		return npairs.autopairs_cr()
	end
end
remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })
MUtils.BS = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
		return npairs.esc("<c-e>") .. npairs.autopairs_bs()
	else
		return npairs.autopairs_bs()
	end
end
remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })

-- null-ls
local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics
local codeActions = require("null-ls").builtins.code_actions
require("null-ls").setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		diagnostics.codespell,
		diagnostics.eslint,
		codeActions.eslint,
	},
	diagnostics_format = "[#{c}] #{m} (#{s})",
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})

-- TreeSitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"tsx",
		"scss",
		"typescript",
		"javascript",
		"vue",
	},
	highlight = {
		enable = true,
		disable = {},
	},
})
