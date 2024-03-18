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
      local servers = {
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
        taplo = {},
      }

      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        local builtin = require 'telescope.builtin'

        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('gi', builtin.lsp_implementations, '[G]oto [I]mplementation')
        nmap('<leader>da', builtin.diagnostics, '[D]i[A]gnostics')
      end

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
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {
              root_dir = util.root_pattern '.git',
              settings = servers[server_name],
              on_attach = on_attach,
              capabilities = capabilities,
            }
          end,
        },
      }
    end,
  },
}
