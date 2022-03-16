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

-- git sign
vim.g.signify_sign_add               = "+"
vim.g.signify_sign_delete            = '_'
vim.g.signify_sign_delete_first_line = '‾'
vim.g.signify_sign_change            = '~'

-- emmet
vim.g.user_emmet_mode = 'a'
vim.g.user_emmet_leader_key = '<C-y>'

-- coc config
local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end
function tab_completion()
  if vim.fn.pumvisible() > 0 then
    return utils.esc('<C-n>') 
  end
  if check_back_space() then
    return utils.esc('<TAB>')
  end
  return vim.fn['coc#refresh']()
end
utils.map('i', '<TAB>', 'v:lua.tab_completion()', { expr = true, noremap = false })
utils.map('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<S-TAB>"', { expr = true, noremap = false })

-- Auto Pairs
local npairs = require('nvim-autopairs')
npairs.setup({
  map_cr = false
})
_G.MUtils= {}
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    return vim.fn["coc#_select_confirm"]()
  else
    return npairs.autopairs_cr()
  end
end
utils.map('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
