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
        'volar@1.8.27',
        'jsonls',
        'rust_analyzer',
        'taplo',
        'cssls',
      }
      local server_settings = {
        lua_ls = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
        volar = {},
        jsonls = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
        cssls = {},
        taplo = {},
        rust_analyzer = {},
      }

      require('neodev').setup()
      require('fidget').setup()
      require('mason').setup()

      local util = require 'lspconfig.util'

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      require('mason-lspconfig').setup {
        ensure_installed = server_names,
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {
              root_dir = util.root_pattern '.git',
              settings = server_settings[server_name],
              on_attach = on_attach,
              capabilities = capabilities,
            }
          end,
        },
      }
    end,
  },
}
