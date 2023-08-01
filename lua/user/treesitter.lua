local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	modules = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	-- 启用增量选择
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	-- comment out rainbow to fix E13 "file exists,add ! to override" error
	-- rainbow = {
	--   enable = true,
	--   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	--   max_file_lines = nil, -- Do not enable for files with more than n lines, int
	-- },
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
		"toml",
		"vim",
		"yaml",
	},
	sync_install = false,
	ignore_install = {},
	auto_install = true,
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
