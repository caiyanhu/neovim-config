-- only run linters named in ale_linters settings
vim.g.ale_linters_explicit = 1

-- linters
vim.g.ale_linters_aliases = {
    vue = {'vue', 'javascript'},
    jsx = {'css', 'javascript'},
}
vim.g.ale_linters = {
    javascript = {"eslint"},
    json = {'prettier'},
    typescript = {'eslint'},
    vue = {'eslint', 'vls'},
    scss = {'stylelint'},
    sass = {'stylelint'},
    less = {'stylelint'},
    css = {'stylelint'},
    html = {'prettier'},
    jsx = {'stylelint', 'eslint'},
}

-- fixers
vim.g.ale_fixers = {
    javascript = {"prettier"},
    json = {'prettier'},
    typescript = {'prettier'},
    vue = {'prettier'},
    scss = {'prettier'},
    sass = {'prettier'},
    less = {'prettier'},
    css = {'prettier'},
    html = {'prettier'},
    jsx = {'prettier'}
}

vim.g.ale_fix_on_save = 0

-- change the signs ALE use
vim.g.ale_sign_error = '🔞'
vim.g.ale_sign_warning = '⚠️ '
vim.cmd [[ highlight clear ALEErrorSign ]]
vim.cmd [[ highlight clear ALEWarningSign ]]

-- jump diagnostic
local utils = require('utils')
utils.map('n', '[e', ':ALEPreviousWrap<CR>', {silent = true})
utils.map('n', ']e', ':ALENextWrap<CR>', {silent = true})
