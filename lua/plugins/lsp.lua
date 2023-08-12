return {
  {
    "neovim/nvim-lspconfig",
    cmd = {
      "Mason"
    },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      "nvimdev/lspsaga.nvim"
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
        jsonls = {}
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
        nmap('gr', "<cmd>:Lspsaga rename ++project<cr>", '[R]e[n]ame')
        nmap('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('gR', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('<leader>da', require('telescope.builtin').diagnostics, '[D]i[A]gnostics')
        nmap('<leader>ca', "<cmd>:Lspsaga code_action", '[C]ode [A]ctions')
        nmap("<leader>f", function()
          vim.lsp.buf.format { async = true }
        end, "[F]ormat code")
      end

      require("neodev").setup()
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