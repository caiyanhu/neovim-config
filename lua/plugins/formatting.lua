return {
  {
    "stevearc/conform.nvim",
    cond = not vim.g.vscode,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local langs_use_prettier = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "typescript",
        "typescriptreact",
        "vue",
        "yaml",
      }
      local formatters = {}
      for _, name in pairs(langs_use_prettier) do
        formatters[name] = { "prettier" }
      end
      formatters["lua"] = { "stylua" }
      formatters["rust"] = { "rustfmt" }

      require("conform").setup({
        formatters_by_ft = formatters,
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
          async = false,
        },
      })
    end,
  },
}
