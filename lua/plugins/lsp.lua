return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      "nvimdev/lspsaga.nvim",
      "b0o/schemastore.nvim",
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
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
              enable = false
            }
          }
        },
        tsserver = {},
        volar = {},
        jsonls = {
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          },
        },
      }

      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('K', "<cmd>:Lspsaga hover_doc<cr>", 'Hover Documentation')
        nmap('gr', "<cmd>:Lspsaga rename<cr>", '[R]e[n]ame')
        nmap('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('gR', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('<leader>da', require('telescope.builtin').diagnostics, '[D]i[A]gnostics')
        nmap('<leader>ca', "<cmd>:Lspsaga code_action", '[C]ode [A]ctions')
        nmap("<leader>f", function()
          vim.lsp.buf.format { async = true }
        end, "[F]ormat code")
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach-format', { clear = true }),
        callback = function(args)
          local client_id = args.data.client_id
          local client = vim.lsp.get_client_by_id(client_id)
          local bufnr = args.buf
          local format_is_enabled = true

          local _augroups = {}
          local get_augroup = function(c)
            if not _augroups[c.id] then
              local group_name = 'lsp-format-' .. c.name
              local id = vim.api.nvim_create_augroup(group_name, { clear = true })
              _augroups[c.id] = id
            end

            return _augroups[c.id]
          end

          -- Only attach to clients that support document formatting
          if not client.server_capabilities.documentFormattingProvider then
            return
          end

          -- Create an autocmd that will run *before* we save the buffer.
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
              if not format_is_enabled then
                return
              end

              vim.lsp.buf.format {
                async = false,
                filter = function(c)
                  return c.id == client.id
                end,
              }
            end,
          })
        end
      })

      require("neodev").setup()
      require("fidget").setup()
      require('lspsaga').setup()
      require("mason").setup()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              settings = servers[server_name],
              on_attach = on_attach,
              capabilities = capabilities
            })
          end
        }
      })
    end
  }
}
