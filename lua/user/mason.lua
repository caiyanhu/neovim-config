local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end
local status_mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_lspconfig_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({})