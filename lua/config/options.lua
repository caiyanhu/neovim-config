local options = {
  relativenumber = true,
  number = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  wrap = false,
  ignorecase = true,
  smartcase = true,
  cursorline = true,
  termguicolors = true,
  background = "dark",
  signcolumn = "yes",
  backspace = "indent,eol,start",
  clipboard = "unnamedplus",
  splitright = true,
  splitbelow = true,
  swapfile = false,
  undofile = true,
  updatetime = 1000,
  autoread = true,
  autowrite = true,
  jumpoptions = "stack",
  spell = false,
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
