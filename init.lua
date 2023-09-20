if not vim.g.vscode then
	vim.loader.enable()
end
require("options")
require("keymaps")
require("globalVar")
require("lazy_nvim")
