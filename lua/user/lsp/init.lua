local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local M = {}

local servers = {
  html = {},
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
      }
    }
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
      },
    },
  },
  tsserver = {},
  volar = {},
  rust_analyzer = {},
}

local function on_attach(client, bufnr)
  if client.name == "tsserver"
      or client.name == "volar"
      or client.name == "rust_analyzer"
      or client.name == "taplo"
  then
    client.server_capabilities.document_formatting = false
  end
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

-- Setup LSP handlers
require("user.lsp.handlers").setup()
require("nvim-lsp-installer").setup {}

require("user.lsp.installer").setup(servers, opts)
