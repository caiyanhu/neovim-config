local options = {
  -- line numbers
  -- show relative line numbers
  relativenumber = true,
  -- shows absolute line number on cursor line (when relative number is on)
  number = true,

  -- tabs & indentation
  -- 2 spaces for tabs (prettier default)
  tabstop = 2,
  -- 2 spaces for indent width
  shiftwidth = 2,
  -- expand tab to spaces
  expandtab = true,
  -- copy indent from current line when starting new one
  autoindent = true,

  -- line wrapping
  -- disable line wrapping
  wrap = false,

  -- search settings
  -- ignore case when searching
  ignorecase = true,
  -- if you include mixed case in your search, assumes you want case-sensitive
  smartcase = true,

  -- cursor line
  -- highlight the current cursor line
  cursorline = true,

  -- appearance

  -- turn on termguicolors for nightfly colorscheme to work
  -- (have to use iterm2 or any other true color terminal)
  termguicolors = true,
  -- colorschemes that can be light or dark will be made dark
  background = "dark",
  -- show sign column so that text doesn't shift
  signcolumn = "yes",

  -- backspace
  -- allow backspace on indent, end of line or insert mode start position
  backspace = "indent,eol,start",

  -- clipboard
  -- use system clipboard as default register
  clipboard = "unnamedplus",

  -- split windows
  -- split vertical window to the right
  splitright = true,
  -- split horizontal window to the bottom
  splitbelow = true,

  -- turn off swapfile
  swapfile = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
