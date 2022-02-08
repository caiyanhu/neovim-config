local nvim_lsp = require('lspconfig')
local coq = require("coq")
local util = require 'lspconfig.util'

local function get_typescript_server_path(root_dir)
  local project_root = util.find_node_modules_ancestor(root_dir)

  local local_tsserverlib = project_root ~= nil and util.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js')
  local global_tsserverlib = '/home/caiyanhu/.npm/lib/node_modules/typescript/lib/tsserverlibrary.js'

  if local_tsserverlib and util.path.exists(local_tsserverlib) then
    return local_tsserverlib
  else
    return global_tsserverlib
  end
end

nvim_lsp.volar.setup(coq.lsp_ensure_capabilities( vim.tbl_deep_extend("force", {
    on_attach = lsp_on_attach,
    capabilities = capabilities,
    flags = {debounce_text_changes = 150},
    init_options = config,
    on_new_config = function(new_config, new_root_dir)
      new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
    end,
    -- enable Take Over Mode
    -- filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}, {})))

local cfg = nvim_lsp.volar
if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
    print(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
end
