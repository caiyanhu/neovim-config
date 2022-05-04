require("hop").setup {
  keys = "etovxqpdygfblzhckisuran"
}
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require'hop'.hint_words()<CR>", {})
