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

      vim.lsp.enable 'tailwindcss'

      vim.lsp.enable 'ts_ls'

      vim.lsp.enable 'jsonls'

      local vue_language_server_path = '/usr/local/lib/node_modules/@vue/language-server'
      local vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }
      vim.lsp.config('vtsls', {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
        filetypes = {
          'typescript',
          'javascript',
          'javascriptreact',
          'typescriptreact',
          'vue',
        },
      })
      vim.lsp.enable('vue_ls')
      vim.lsp.enable('vtsls')
    end,
  },
}
