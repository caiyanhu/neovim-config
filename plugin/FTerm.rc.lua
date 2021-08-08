require('FTerm').setup {
  dimensions = {
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5
  },
  border = 'single'
}

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map('n', '<A-`>', '<CMD>lua require("FTerm").toggle()<CR>', opt)
map('t', '<A-`>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opt)
