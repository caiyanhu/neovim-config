return {
  {
    'echasnovski/mini.pairs',
    event = "VeryLazy",
    version = false,
    config = true
  },
  {
    'echasnovski/mini.comment',
    event = "VeryLazy",
    version = false,
    config = true
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Open the neo-tree", mode = { "n", "v" }
      }
    },
    config = true
  },
  {
    'MattesGroeger/vim-bookmarks',
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
    "kamykn/spelunker.vim",
    event = "VeryLazy",
    cond = function()
      -- TODO: Linux下加载此插件，macOs下还是想用cspell
      return jit.os == 'Linux'
    end,
    config = function()
      vim.g.spelunker_check_type = 2
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = {}
  }
}
