return {
  {
    'MattesGroeger/vim-bookmarks',
    dependencies = {
      'tom-anders/telescope-vim-bookmarks.nvim',
    },
    event = { 'BufWritePost', 'BufReadPost' },
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
      vim.g.bookmark_sign = '🎯'
      vim.g.bookmark_highlight_lines = 1

      require('telescope').load_extension 'vim_bookmarks'
      vim.api.nvim_set_keymap(
        'n',
        'mm',
        ':BookmarkToggle<CR>',
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        'mi',
        ':BookmarkAnnotate',
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        'mn',
        ':BookmarkNext<CR>',
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        'mp',
        ':BookmarkPrev<CR>',
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        'ma',
        "<CMD>lua require('telescope').extensions.vim_bookmarks.all()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        'mc',
        "<CMD>lua require('telescope').extensions.vim_bookmarks.current_file()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        'mx',
        ':BookmarkClearAll<CR>',
        { noremap = true, silent = true }
      )

      vim.cmd [[ highlight BookmarkSign ctermbg=NONE ctermfg=160 ]]
      vim.cmd [[ highlight BookmarkLine ctermbg=194 ctermfg=NONE ]]
    end,
  },
}
