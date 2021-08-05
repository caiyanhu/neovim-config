local saga = require 'lspsaga'

saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = ' ',
    warn_sign = ' ',
    hint_sign = ' ',
    infor_sign = ' ',
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
    max_preview_lines = 20,
    definition_preview_icon = '  '
}

-- Shortcut
local utils = require('utils')
-- code action
utils.map('n', '<leader>ca', ':Lspsaga code_action<CR>', {silent = true})
utils.map('v', '<leader>ca', ':Lspsaga range_code_action<CR>', {silent = true})
-- show hover doc
utils.map('n', 'K', ':Lspsaga hover_doc<CR>', {silent = true})
-- preview definition
utils.map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {silent = true})
-- scroll in definition preview
-- utils.map('n', '<c-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', {silent = true})
-- utils.map('n', '<c-d>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', {silent = true})
-- rename
utils.map('n', 'gr', ':Lspsaga rename<CR>', {silent = true})
-- show signature help
utils.map('n', 'gs', ':Lspsaga signature_help<CR>', {silent = true})
