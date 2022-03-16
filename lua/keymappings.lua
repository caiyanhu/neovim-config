local utils = require('utils')
utils.map('n', '<BS>', ':nohlsearch<CR>') -- Clear highlights
utils.map('n', 'L', '$')
utils.map('n', 'H', '^')
utils.map('n', 'Q', 'q') -- use Q to record macro
utils.map('n', 'q', '<Nop>')
utils.map('n', 'Y', 'y$') -- yank to end of line
utils.map('n', '<C-s>', ':write<CR>')
utils.map('n', '<M-h>', '<C-w>h')
utils.map('n', '<M-j>', '<C-w>j')
utils.map('n', '<M-k>', '<C-w>k')
utils.map('n', '<M-l>', '<C-w>l')

utils.map('i', '<M-o>', '<Esc>o') -- open next line with insert mode
utils.map('i', '<M-h>', '<Esc>^i') -- jump to start with insert mode
utils.map('i', '<M-l>', '<END>') -- jump to end without leaving mode
utils.map('i', '<C-h>', '<left>')
utils.map('i', '<C-j>', '<down>')
utils.map('i', '<C-k>', '<up>')
utils.map('i', '<C-l>', '<right>')
utils.map('i', '<C-a>', '<HOME>')
utils.map('i', '<C-e>', '<END>')
utils.map('i', '<C-c>', '<Esc>') -- without this line, press <C-c> after 'o' will cause 'error executing lua callback keyboard interrupt'
