return {
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    cond = not vim.g.vscode,
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('todo-comments').setup()
      vim.keymap.set('n', ']t', function()
        require('todo-comments').jump_next()
      end, { desc = 'Next todo comment' })

      vim.keymap.set('n', '[t', function()
        require('todo-comments').jump_prev()
      end, { desc = 'Previous todo comment' })

      vim.api.nvim_set_keymap(
        'n',
        '<leader>td',
        '<CMD>TodoTelescope<CR>',
        { noremap = true, silent = true }
      )
    end,
  },
}
