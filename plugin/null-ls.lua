local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

local au_group = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    -- code actions
    code_actions.cspell,
    -- diagnostics
    diagnostics.cspell, -- use ~/.cspell.json as config file
    diagnostics.eslint.with({
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    }),
    diagnostics.tsc,
    diagnostics.selene,
    -- formatting
    formatting.stylua,
    formatting.prettier,
    formatting.rustfmt,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = au_group, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = au_group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
