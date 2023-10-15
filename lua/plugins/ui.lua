return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cond = not vim.g.vscode,
    opts = {
      char = "│",
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    cond = not vim.g.vscode,
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = true,
  },
  {
    "norcalli/nvim-colorizer.lua",
    cond = not vim.g.vscode,
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "MattesGroeger/vim-bookmarks",
    event = { "BufWritePost", "BufReadPost" },
    cond = not vim.g.vscode,
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

      vim.api.nvim_set_keymap("n", "mm", ":BookmarkToggle<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "mi", ":BookmarkAnnotate", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "mn", ":BookmarkNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "mp", ":BookmarkPrev<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ma", ":BookmarkShowAll<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "mc", ":BookmarkClear<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "mx", ":BookmarkClearAll<CR>", { noremap = true, silent = true })

      vim.cmd([[ highlight BookmarkSign ctermbg=NONE ctermfg=160 ]])
      vim.cmd([[ highlight BookmarkLine ctermbg=194 ctermfg=NONE ]])
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    cond = not vim.g.vscode,
    version = false,
    config = true,
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    version = false,
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      --[[
      --    Old text                    Command         New text
      --------------------------------------------------------------------------------
      surr*ound_words             ysiw)           (surround_words)
      *make strings               ys$"            "make strings"
      [delete ar*ound me!]        ds]             delete around me!
      remove <b>HTML t*ags</b>    dst             remove HTML tags
      'change quot*es'            cs'"            "change quotes"
      <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
      delete(functi*on calls)     dsf             function calls
      --]]
      require("nvim-surround").setup()
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    cond = not vim.g.vscode,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cond = not vim.g.vscode,
    keys = {
      {
        "<leader>xx",
        function()
          require("trouble").toggle()
        end,
      },
    },
  },
}
