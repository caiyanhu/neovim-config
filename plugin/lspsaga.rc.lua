local saga = require 'lspsaga'

saga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
}

-- Shortcut
local utils = require('utils')
utils.map('n', 'K', ':Lspsaga hover_doc<CR>', {silent = true})
utils.map('n', 'gr', ':Lspsaga rename<CR>', {silent = true})
