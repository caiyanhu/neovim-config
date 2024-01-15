return {
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd [[colorscheme tokyonight]]
  --   end,
  -- },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = {},
    config = function()
      vim.o.background = 'dark'
      vim.cmd [[colorscheme gruvbox]]
    end,
  },
}
