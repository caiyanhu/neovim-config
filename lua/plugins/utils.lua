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
  {
    'Exafunction/codeium.vim',
    config = function()
      vim.keymap.set('i', '<cr>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<S-Tab>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },
  {
    "vladdoster/remember.nvim",
    opts = {}
  }
}
