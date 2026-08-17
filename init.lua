if vim.fn.has("nvim-0.12") ~= 1 then
  error("This config requires Neovim >= 0.12")
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.packages")
require("plugins")
require("config.commands")
