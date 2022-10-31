local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.floaterm_width = 150
vim.g.floaterm_winblend = 0

keymap("n", "<M-`>", ":FloatermToggle<cr>", opts)
keymap("i", "<M-`>", "<Esc>:FloatermToggle<cr>", opts)
keymap("t", "<M-`>", "<C-\\><C-n>:FloatermToggle<cr>", term_opts)
