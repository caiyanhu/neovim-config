local lsp_installer_servers = require("nvim-lsp-installer.servers")
local lspConfig = require("lspconfig")

local M = {}

function M.setup(servers, options)
  for server_name, _ in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)

    if server_available then
      server:on_ready(function()
        local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})

        if server.name == "sumneko_lua" then
          local lua_opts = require("user.lsp.settings.sumneko_lua")
          opts = vim.tbl_deep_extend("force", lua_opts, opts)
        end

        lspConfig[server_name].setup(opts)
      end)

      if not server:is_installed() then
        vim.notify("Installing ", vim.log.levels.INFO, { title = server.name })
        server:install()
      end
    else
      vim.notify("Error ", vim.log.levels.ERROR)
    end
  end
end

return M
