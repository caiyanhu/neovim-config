return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    cond = not vim.g.vscode,
    keys = {
      {
        '<leader>xx',
        function()
          require('trouble').toggle()
        end,
      },
    },
  },
}
