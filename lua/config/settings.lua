local utils = require('utils')

local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('b', 'smartindent', true)
-- tab扩展为空格
utils.opt('b', 'expandtab', true)
utils.opt('b', 'tabstop', 2)
-- 连续数量的空格看作一个制表符
utils.opt('b', 'softtabstop', 2)
utils.opt('b', 'shiftwidth', 2)
utils.opt('o', 'smarttab', true)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'hlsearch', true)
utils.opt('o', 'incsearch', true)
utils.opt('o', 'clipboard', 'unnamed,unnamedplus')
utils.opt('o', 'showcmd', true)
utils.opt('b', 'swapfile', false)
utils.opt('o', 'spell', false)
utils.opt('o', 'updatetime', 300)
-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
