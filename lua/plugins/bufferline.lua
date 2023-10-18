return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    cond = not vim.g.vscode,
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant",
      },
    },
  },
}
