local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

-- Utilities for creating configurations
local util_status, util = pcall(require, "formatter.util")
if not util_status then
	return
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		vue = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		toml = {
			require("formatter.filetypes.toml").taplo,
		},
		-- any other filetypes
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
