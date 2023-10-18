return {
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
}
