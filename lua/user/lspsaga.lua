local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga({
  custom_kind=require("catppuccin.groups.integrations.lsp_saga").custom_kind()
})
