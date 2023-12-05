return {
  "nvim-treesitter/nvim-treesitter",
  cmd = { "TSUpdateSync" },
  cond = not vim.g.vscode,
  event = { "VeryLazy" },
  build = ":TSUpdate",
  config = function()
    local opts = {
      ensure_installed = {
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "rust",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
      },
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      playground = {
        enable = true,
      },
    }

    require("nvim-treesitter.configs").setup(opts)

    if jit.os == "Windows" then
      require("nvim-treesitter.install").compilers = { "clang" }
    end
  end,
}
