local utils = require('utils');
local cmd = vim.cmd;

utils.opt('o', 'termguicolors', true);
cmd 'colorscheme material';
-- 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
vim.g.material_theme_style = 'darker';
