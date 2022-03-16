vim.g.mapleader = ' '

require('keymappings')
require('plugins')
require('settings')
local utils = require('utils')
require('lsp')


-- telescope command
utils.map('n', '<C-p>', ':lua require("telescope.builtin").find_files()<cr>')
utils.map('n', '<leader>f', ':lua require("telescope.builtin").live_grep()<cr>')
utils.map('n', '<leader>b', ':lua require("telescope.builtin").buffers()<cr>')

-- nvim-tree
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
    },
    folder = {
      arrow_open = "ᗐ",
      arrow_closed = "ᗒ",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },
    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
}
utils.map('n', '<leader>e', ':NvimTreeToggle<CR>')
utils.map('n', '<leader>r', ':NvimTreeRefresh<CR>')
utils.map('v', '<leader>e', ':NvimTreeToggle<CR>')
utils.map('v', '<leader>r', ':NvimTreeRefresh<CR>') 

-- auto pairs
require('nvim-autopairs').setup({
  map_cr = false
})


-- git sign
vim.g.signify_sign_add               = "+"
vim.g.signify_sign_delete            = '_'
vim.g.signify_sign_delete_first_line = '‾'
vim.g.signify_sign_change            = '~'

-- emmet
vim.g.user_emmet_mode = 'a'
vim.g.user_emmet_leader_key = '<C-y>'

-- coc config
