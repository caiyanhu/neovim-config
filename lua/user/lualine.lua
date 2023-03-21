local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- Color table for highlights
local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
	graybg = "#e6e9ef",
	jordyblue = "#96b4f7",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		-- theme = {
		-- 	-- We are going to use lualine_c an lualine_x as left and
		-- 	-- right section. Both are highlighted by c theme .  So we
		-- 	-- are just setting default looks o statusline
		-- 	normal = { c = { fg = colors.fg, bg = colors.bg } },
		-- 	inactive = { c = { fg = colors.fg, bg = colors.bg } },
		-- },
		theme = "catppuccin",
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_v = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_a at left section
local function ins_left_a(component)
	table.insert(config.sections.lualine_a, component)
end
-- Inserts a component in lualine_b at left section
local function ins_left_b(component)
	table.insert(config.sections.lualine_b, component)
end
-- Inserts a component in lualine_c at left section
local function ins_left_c(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right_x(component)
	table.insert(config.sections.lualine_x, component)
end
-- Inserts a component in lualine_y ot right section
local function ins_right_y(component)
	table.insert(config.sections.lualine_y, component)
end

ins_left_a({ "mode" })

ins_left_a({ "location" })

ins_left_b({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	color_error = colors.red,
	color_warn = colors.yellow,
	color_info = colors.cyan,
	color_hint = colors.magenta,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left_c({
	"filename",
	path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
	symbols = {
		modified = "♻️", -- Text to show when the file is modified.
		readonly = "🚫", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
		newfile = "[New]", -- Text to show for newly created file before first write
	},
})

ins_right_x({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = "",
	color = { fg = colors.magenta, gui = "bold" },
})

-- Add components to right sections
-- ins_right({
-- 	"o:encoding", -- option component same as &encoding in viml
-- 	upper = true, -- I'm not sure why it's upper case either ;)
-- 	condition = conditions.hide_in_width,
-- 	color = { fg = colors.green, gui = "bold" },
-- })

ins_right_y({
	"branch",
	icon = "",
	condition = conditions.check_git_workspace,
	color = { fg = colors.cyan, gui = "bold" },
})

-- ins_right({
-- 	"diff",
-- 	-- Is it me or the symbol for modified us really weird
-- 	symbols = { added = " ", modified = "柳", removed = " " },
-- 	color_added = colors.green,
-- 	color_modified = colors.orange,
-- 	color_removed = colors.red,
-- 	condition = conditions.hide_in_width,
-- })

lualine.setup(config)
