-- map leader to space
vim.g.mapleader = ' '

local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exits
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Install plugins
require('plugins')

-- Key mappings
require('keymappings')

-- Group configuration in one folder
require('config')

-- Init Auto Pairs
require('nvim-autopairs').setup()

-- Init Color Highlighter
require('colorizer').setup()

-- LSP Configuration
require('languageServerConfig')
local nvim_lsp = require('lspconfig')
nvim_lsp.diagnosticls.setup {
  filetypes = {'javascript', 'typescript'},
  init_options = {
    linters = {
      eslint = {
        command = './node_modules/.bin/eslint',
        rootPatterns = {'.git'},
        debounce = 100,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
    },
    filetypes = {
      javascript = 'eslint',
      typescript = 'eslint'
    },
    formatters = {
      prettier = {
        command = "./node_modules/.bin/prettier",
        args = {"--stdin-filepath" ,"%filepath", '--single-quote', '--print-width 120'}
      }
    },
    formatFiletypes = {
      javascript = "prettier"
    },
  }
}
