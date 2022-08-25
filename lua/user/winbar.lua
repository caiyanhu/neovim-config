local M = {}

local winbar_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
	"alpha",
	"lir",
	"Outline",
	"spectre_panel",
	"toggleterm",
}

vim.api.nvim_set_hl(0, "WinBarPath", { bg = "#4A3E4B", fg = "#C1ADC4" })

function M.eval()
	if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
		return ""
	end
	local file_path = vim.api.nvim_eval_statusline("%f", {}).str
	local modified_status = vim.api.nvim_eval_statusline("%M", {}).str == "+" and "🚀" or ""

	file_path = file_path:gsub("/", "➤")

	return "%#WinBarPath#" .. file_path .. "%*" .. " " .. "%#WinBarModified#" .. modified_status .. "%*"
end

return M
