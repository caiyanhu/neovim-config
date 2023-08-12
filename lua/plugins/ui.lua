return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = true
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = true
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
    config = true
  },
  {
    'RRethy/vim-illuminate',
    event = "VeryLazy",
    config = function()
      require('illuminate').configure()
    end
  }
}
