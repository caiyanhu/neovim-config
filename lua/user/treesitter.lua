local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- Fix Error opening archive
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/2847
require("nvim-treesitter.install").prefer_git = true

configs.setup({
	ensure_installed = {
		"tsx",
		"typescript",
		"javascript",
		"json",
		"html",
		"scss",
		"lua",
		"css",
		"vue",
		"rust",
		"toml",
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
