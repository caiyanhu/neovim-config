local status, trouble = pcall(require, "trouble")
if not status then
	return
end

trouble.setup({
	position = "bottom", -- position of the list can be: bottom, top, left, right
	height = 10, -- height of the trouble list when position is top or bottom
	width = 50, -- width of the list when position is left or right
	icons = true, -- use devicons for filenames
	mode = "quickfix", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
	fold_open = "", -- icon used for open folds
	fold_closed = "", -- icon used for closed folds
	group = true, -- group results by file
	padding = true, -- add an extra new line on top of the list
	indent_lines = true, -- add an indent guide below the fold icons
	signs = {
		-- icons / text used for a diagnostic
		error = "",
		warning = "",
		hint = "",
		information = "",
		other = "﫠",
	},
	use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
})
