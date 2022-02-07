-- map leader to space
vim.g.mapleader = ' '

local fn = vim.fn
local execute = vim.api.nvim_command

-- Install plugins
require('plugins')

-- Load Configuration
require('config')

-- Init Auto Pairs
require('nvim-autopairs').setup()

-- Init Color Highlighter
require('colorizer').setup()

-- LSP Configuration
require('languageServerConfig')

-- Init smooth scrolling
require('neoscroll').setup({
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', 'G', 'gg'},
})

vim.cmd [[
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END
]]
