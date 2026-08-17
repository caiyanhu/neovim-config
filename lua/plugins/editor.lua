require("conform").setup({
  format_on_save = {
    timeout_ms = 2500,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    toml = { "taplo" },
    python = { "ruff_format" },
  },
})

require("mini.pairs").setup()

require("FTerm").setup({
  border = "double",
  dimensions = { height = 0.9, width = 0.9 },
})
vim.keymap.set("n", "<A-`>", require("FTerm").toggle)
vim.keymap.set("t", "<A-`>", function()
  vim.cmd.stopinsert()
  require("FTerm").toggle()
end)

require("nvim-highlight-colors").setup({})
