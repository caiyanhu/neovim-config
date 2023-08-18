return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = true
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 300
        }
      })
    end
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
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require 'colorizer'.setup()
    end
  },
  {
    'MattesGroeger/vim-bookmarks',
    event = "VeryLazy",
    config = function()
      -- vim.g.bookmark_sign = "💙"
      -- vim.g.bookmark_sign = "♥"
      -- vim.g.bookmark_sign = "⚑"
      -- vim.g.bookmark_sign = "🐯"
      -- vim.g.bookmark_sign = "🚩"
      -- vim.g.bookmark_sign = "🎀"
      -- vim.g.bookmark_sign = "🔵"
      -- vim.g.bookmark_sign = "🔥"
      -- vim.g.bookmark_sign = "⭐"
      vim.g.bookmark_sign = "🎯"
      vim.g.bookmark_highlight_lines = 1
      vim.cmd([[ highlight BookmarkSign ctermbg=NONE ctermfg=160 ]])
      vim.cmd([[ highlight BookmarkLine ctermbg=194 ctermfg=NONE ]])
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = {}
  },
}
