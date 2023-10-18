return {
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    version = false,
    config = true,
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    cond = not vim.g.vscode,
    version = false,
    config = true,
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
}
