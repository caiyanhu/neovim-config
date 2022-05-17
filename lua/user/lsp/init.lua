local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local M = {}

local function on_attach(client, bufnr)
  -- Configure key mappings
  require("user.lsp.keymaps").setup(client, bufnr)

  -- Configure highlighting
  require("user.lsp.highlighting").setup(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not has_cmp then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local opts = {
  on_attach = on_attach,
  capabilities = M.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}
require("user.lsp.handlers").setup()

local servers = { "tsserver", "volar", "html", "cssls", "jsonls", "rust_analyzer", "volar", "sumneko_lua" }
for _, lsp in pairs(servers) do
  if lsp == "sumneko_lua" then
    local lua_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end
  require("lspconfig")[lsp].setup(opts)
end
