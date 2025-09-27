vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig.git" },
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.7.0" },
})

-- blink cmp
require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = { auto_show = false },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})

-- 通用 on_attach 函数，用来在 LSP 附加到 buffer 后设置 keymaps 等
local function on_attach()
  -- 常用 LSP 功能 keymap
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Document" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
  end, { desc = "Prev Diagnostic" })
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
  end, { desc = "Next Diagnostic" })
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic Float" })
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to LocList" })
end

-- 统一的 capabilities (由 blink.cmp 提供
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- LSP 配置表
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

  vtsls = {
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/@vue/language-server",
              languages = { "vue" },
              configNamespace = "typescript",
            },
          },
        },
      },
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  },

  -- 其它简单 LSP
  cspell_ls = {},
  jsonls = {},
  tailwindcss = {},
  taplo = {},
  vue_ls = {},
}

-- 循环批量配置 LSP
for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = capabilities
  vim.lsp.config(server, config)
end

-- 启用LSP, 注意先保证已安装对应的language server
vim.lsp.enable(vim.tbl_keys(servers))

-- 全局诊断配置，如果你想自定义显示样式
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- 小圆点
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- 插入模式下不更新诊断
  severity_sort = true,
})
