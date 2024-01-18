return {
  {
    'windwp/nvim-ts-autotag',
    cond = not vim.g.vscode,
    event = 'VeryLazy',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
}
