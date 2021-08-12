local utils = require('utils');
local cmd = vim.cmd;

utils.opt('o', 'termguicolors', true);
utils.opt('o', 'background', 'light')
cmd 'colorscheme PaperColor'
