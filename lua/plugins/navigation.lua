require("neo-tree").setup({})
vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle<cr>")

vim.keymap.set({ "n", "v" }, "<C-p>", "<cmd>FzfLua files<cr>")
vim.keymap.set({ "n", "v" }, "<leader><space>", "<cmd>FzfLua buffers<cr>")
vim.keymap.set({ "n", "v" }, "<leader>g", "<cmd>FzfLua live_grep<cr>")
vim.keymap.set({ "n", "v" }, "<leader>r", "<cmd>FzfLua resume<cr>")
vim.keymap.set({ "n", "v" }, "<leader>?", "<cmd>FzfLua oldfiles<cr>")
vim.keymap.set("n", "<leader>sf", "<cmd>SearchInFolder<cr>", {
  desc = "Search in folder (fzf-lua)",
})

require("todo-comments").setup()
vim.keymap.set("n", "<leader>td", "<cmd>TodoFzfLua<cr>")

require("trouble").setup()
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {
  desc = "Diagnostics (Trouble)",
})
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", {
  desc = "Location List (Trouble)",
})
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", {
  desc = "Quickfix List (Trouble)",
})

vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")

vim.g.bookmark_sign = "🎯"
vim.g.bookmark_highlight_lines = 1
