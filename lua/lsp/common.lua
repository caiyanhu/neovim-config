return {
  {
    'neovim/nvim-lspconfig',
    cond = not vim.g.vscode,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
      'b0o/schemastore.nvim',
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
      },
    },
    config = function()
      local server_names = {
        'lua_ls',
        'volar',
        'jsonls',
        'rust_analyzer',
        'taplo',
        'cssls',
        'ts_ls',
      }

      require('neodev').setup()
      require('fidget').setup()
      require('mason').setup()

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require('mason-lspconfig').setup {
        ensure_installed = server_names,
        handlers = {
          -- default handler
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
            }
          end,

          -- Use volar for only .vue files and ts_ls for .ts and .js files. see https://github.com/vuejs/language-tools/tree/master?tab=readme-ov-file Non-Hybrid mode section
          -- this is the custom handler for typescript
          ts_ls = function()
            local vue_language_server_path = require('mason-registry')
              .get_package('vue-language-server')
              :get_install_path() .. '/node_modules/@vue/language-server'

            require('lspconfig').ts_ls.setup {
              init_options = {
                plugins = {
                  {
                    name = '@vue/typescript-plguin',
                    location = vue_language_server_path,
                    languages = { 'vue' },
                  },
                },
              },
              capabilities = capabilities,
            }
          end,

          -- this is the custom handler for volar
          volar = function()
            require('lspconfig').volar.setup {
              init_options = {
                vue = {
                  hybridMode = false,
                },
              },
              capabilities = capabilities,
            }
          end,

          -- this is the custom handler for json
          jsonls = function()
            require('lspconfig').jsonls.setup {
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                },
              },
              capabilities = capabilities,
            }
          end,

          -- this is the custom handler for lua_ls
          lua_ls = function()
            require('lspconfig').lua_ls.setup {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
              },
              capabilities = capabilities,
            }
          end,
        },
      }
    end,
  },
}
