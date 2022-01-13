local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<M-`>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<M-`>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
