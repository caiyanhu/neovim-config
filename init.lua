if vim.fn.exists("g:vscode") ~= 0 then
  -- VSCode extension
  require("options")
  require("keymaps")
else
  vim.loader.enable()
  require("options")
  require("keymaps")
  require("lazy_nvim")
end
