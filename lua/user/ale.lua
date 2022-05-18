-- only run linters named in ale_linters settings
vim.g.ale_linters_explicit = 1

-- linters
vim.g.ale_linters = {
  css = { "vscode-css-language-server" },
  scss = { "vscode-css-language-server" },
  sass = { "vscode-css-language-server" },
  less = { "stylelint" },
  html = { "vscode-html-language-server" },
  json = { "vscode-json-language-server" },
  javascript = { "eslint" },
  typescript = { "eslint", "tsserver" },
  vue = { "volar" },
  jsx = { "eslint", "tsserver" },
  tsx = { "eslint", "tsserver" },
  rust = { "analyzer" },
  lua = { "luac" }
}

-- fixers
vim.g.ale_fixers = {
  scss = { "prettier" },
  sass = { "prettier" },
  less = { "prettier" },
  css = { "prettier" },
  html = { "prettier" },
  json = { "prettier" },
  rust = { "rustfmt" },
  lua = { "stylua" },
  javascript = { "eslint", "prettier" },
  typescript = { "eslint", "prettier" },
  vue = { "prettier" },
  jsx = { "eslint", "prettier" },
  tsx = { "eslint", "prettier" },
}

vim.g.ale_fix_on_save = 0

-- change the signs ALE use
vim.g.ale_sign_error = "💩"
vim.g.ale_sign_warning = "🚨"
vim.cmd([[ highlight clear ALEErrorSign ]])
vim.cmd([[ highlight clear ALEWarningSign ]])

-- jump diagnostic
vim.api.nvim_set_keymap("n", "[e", ":ALEPreviousWrap<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "]e", ":ALENextWrap<CR>", { silent = true })
