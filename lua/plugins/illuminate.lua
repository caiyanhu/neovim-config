return {
  {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    cond = not vim.g.vscode,
    config = function()
      require('illuminate').configure()
    end,
  },
}
