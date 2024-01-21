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
      -- set background transparent
      -- vim.cmd [[highlight Normal guibg=none]]
      -- vim.cmd [[highlight NonText guibg=none]]
      -- vim.cmd [[highlight Normal ctermbg=none]]
      -- vim.cmd [[highlight NonText ctermbg=none]]
    end,
  },
}
