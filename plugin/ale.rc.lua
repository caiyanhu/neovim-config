-- run only linters explicitly configured
vim.g.ale_linters_explicit = 1

vim.g.ale_linters = {
    typescript = {'eslint', 'tslint'},
    jsx = {'stylelint', 'eslint', 'tslint'},
    javascript = {'prettier', 'eslint'}
    vue = {'eslint', 'vls'}
}
vim.g.ale_fixers = {
    ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
    javascript = {'prettier', 'eslint'},
    css = {'prettier'},
    vue = {'prettier'}
}

-- change signs
vim.g.ale_sign_error = '✗'
vim.g.ale_sign_warning = ''

vim.cmd [[highlight clear ALEErrorSign]]
vim.cmd [[highlight clear ALEWarningSign]]

-- keep the sign gutter open at all times
vim.g.ale_sign_column_always = 1

-- run prettier on save
vim.g.ale_fix_on_save = 1

local utils = require('utils')
utils.map('n', '[e', ':ALEPreviousWrap<CR>', {silent = true})
utils.map('n', ']e', ':ALENextWrap<CR>', {silent = true})
