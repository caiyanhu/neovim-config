local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion

null_ls.setup({
  sources = {
    code_actions.cspell, -- npm install -g cspell@latest
    completion.luasnip,
    diagnostics.eslint,
    diagnostics.selene,  -- cargo install selene
    diagnostics.stylelint, -- npm init stylelint
    formatting.fixjson,  -- npm install -g fixjson
    formatting.stylua,   -- cargo install stylua --features lua54
    formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
        "handlebars",
      },
    }),
    formatting.rustfmt, -- rustup component add rustfmt
    formatting.taplo, -- cargo install taplo-cli --locked
  },
})
