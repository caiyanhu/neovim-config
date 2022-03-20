local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_instjlled = { "tsx", "json", "html", "scss", "lua", "css", "vue" },
	sync_install = false,
	ignore_install = { "" },
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = { "yaml" },
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
