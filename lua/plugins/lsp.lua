require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  appearance = { nerd_font_variant = "mono" },
  completion = { documentation = { auto_show = false } },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("lspsaga").setup({})

local lsp_group = vim.api.nvim_create_augroup("ConfigLspAttach", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
    vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<cr>", opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  end,
})

local function vue_typescript_plugin_path()
  if vim.env.VUE_LANGUAGE_SERVER_PATH and vim.env.VUE_LANGUAGE_SERVER_PATH ~= "" then
    return vim.fn.expand(vim.env.VUE_LANGUAGE_SERVER_PATH)
  end

  local executable = vim.fn.exepath("vue-language-server")
  local resolved = executable ~= "" and vim.uv.fs_realpath(executable) or nil
  if not resolved then
    return nil
  end

  local bin_dir = vim.fs.dirname(resolved)
  return vim.fs.basename(bin_dir) == "bin" and vim.fs.dirname(bin_dir) or nil
end

local vue_plugin_path = vue_typescript_plugin_path()
local vtsls = {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
}

if vue_plugin_path then
  vtsls.settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_plugin_path,
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
    },
  }
end

local capabilities = require("blink.cmp").get_lsp_capabilities()
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  },
  vtsls = vtsls,
  vue_ls = {},
  cspell_ls = {
    cmd = { "cspell-lsp", "--stdio" },
    filetypes = {
      "css",
      "gitcommit",
      "go",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "lua",
      "markdown",
      "python",
      "rust",
      "typescript",
      "typescriptreact",
      "vue",
      "yaml",
    },
    root_markers = { ".git" },
  },
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  tailwindcss = {},
  taplo = {},
  ty = {},
  ruff = {},
}

for server, config in pairs(servers) do
  config.capabilities = capabilities
  vim.lsp.config(server, config)
end

vim.lsp.enable(vim.tbl_keys(servers))

vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 2 },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
