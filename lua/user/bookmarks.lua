vim.g.bookmark_sign = "💙"
-- vim.g.bookmark_sign = "♥"
-- vim.g.bookmark_sign = "⚑"
-- vim.g.bookmark_sign = "🐯"
-- vim.g.bookmark_sign = "🚩"
-- vim.g.bookmark_sign = "🎀"
-- vim.g.bookmark_sign = "🔵"
-- vim.g.bookmark_sign = "🔥"
-- vim.g.bookmark_sign = "⭐"
-- vim.g.bookmark_sign = "🎯"
vim.g.bookmark_highlight_lines = 1
vim.cmd([[ highlight BookmarkSign ctermbg=NONE ctermfg=160 ]])
vim.cmd([[ highlight BookmarkLine ctermbg=194 ctermfg=NONE ]])

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "mm", ":BookmarkToggle<CR>", opts)
keymap("n", "mi", ":BookmarkAnnotate", opts)
keymap("n", "mn", ":BookmarkNext<CR>", opts)
keymap("n", "mp", ":BookmarkPrev<CR>", opts)
keymap("n", "ma", ":BookmarkShowAll<CR>", opts)
keymap("n", "mc", ":BookmarkClear<CR>", opts)
keymap("n", "mx", ":BookmarkClearAll<CR>", opts)
