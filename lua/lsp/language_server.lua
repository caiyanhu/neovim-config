return {
  {
    'neovim/nvim-lspconfig',
    dependenvies = {
      'nvimdev/lspsaga.nvim',
    },
    config = function()
      vim.lsp.config['luals'] = {
        -- Command and arguments to start the server.
        cmd = { 'lua-language-server' },
        -- Filetypes to automatically attach to.
        filetypes = { 'lua' },
        -- Sets the "root directory" to the parent directory of the file in the
        -- current buffer that contains either a ".luarc.json" or a
        -- ".luarc.jsonc" file. Files that share a root directory will reuse
        -- the connection to the same LSP server.
        -- Nested lists indicate equal priority, see |vim.lsp.Config|.
        root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
        -- Specific settings to send to the server. The schema for this is
        -- defined by the server. For example the schema for lua-language-server
        -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
          },
        },
      }
      vim.lsp.enable 'luals'

      vim.lsp.config('ts_ls', {
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
              languages = { 'javascript', 'typescript', 'vue' },
            },
          },
        },
        filetypes = {
          'javascript',
          'typescript',
          'vue',
        },
      })
      vim.lsp.enable 'ts_ls'

      vim.lsp.enable 'tailwindcss'

      vim.lsp.enable 'vue_ls'

      -- JSON
      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      vim.lsp.config('jsonls', {
        capabilities = capabilities,
      })
      vim.lsp.enable 'jsonls'
    end,
  },
}
