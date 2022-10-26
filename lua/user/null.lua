local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end
local utils_status_ok, utils = pcall(require, "null-ls.utils")
if not utils_status_ok then
	return
end

local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		-- code actions
		code_actions.cspell,
		code_actions.gitsigns,
		-- diagnostics
		diagnostics.cspell,
		diagnostics.eslint,
		diagnostics.tsc,
		diagnostics.selene,
		-- formatting
		formatting.stylua,
		formatting.prettierd,
		formatting.rustfmt,
	},
	root_dir = utils.root_pattern(".git"),
})
