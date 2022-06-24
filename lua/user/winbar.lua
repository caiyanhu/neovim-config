local M = {}

vim.api.nvim_set_hl(0, "WinBarPath", { bg = "#dedede", fg = "#363636" })
vim.api.nvim_set_hl(0, "WinBarModified", { bg = "#dedede", fg = "#363636" })

function M.eval()
	local file_path = vim.api.nvim_eval_statusline("%f", {}).str
	local modified_status = vim.api.nvim_eval_statusline("%M", {}).str == "+" and "✅" or ""

	file_path = file_path:gsub("/", "➤")

	return "%#WinBarPath#" .. file_path .. "%*" .. "%#WinBarModified#" .. modified_status .. "%*"
end

return M
