if not vim.g.vscode then
	vim.loader.enable()
end
require("options")
require("keymaps")
require("lazy_nvim")
