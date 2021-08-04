local utils = require('utils')

utils.map('n', '<C-p>', ':Telescope find_files<CR>')
utils.map('n', '<leader>f', ':Telescope live_grep<CR>')
utils.map('n', '<leader>b', ':Telescope buffers<CR>')

local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
            i = {
                ["<esc>"] = actions.close
            },
        },
    },
}
