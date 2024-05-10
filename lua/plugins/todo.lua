return {
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    cond = not vim.g.vscode,
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('todo-comments').setup()

      vim.api.nvim_set_keymap(
        'n',
        '<leader>td',
        '<CMD>TodoTelescope<CR>',
        { noremap = true, silent = true }
      )
    end,
  },
}
