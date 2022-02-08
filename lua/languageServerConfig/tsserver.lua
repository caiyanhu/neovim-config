local nvim_lsp = require('lspconfig')
local coq = require("coq")
nvim_lsp.tsserver.setup(coq.lsp_ensure_capabilities( vim.tbl_deep_extend("force", {
    on_attach = lsp_on_attach,
    capabilities = capabilities,
    flags = {debounce_text_changes = 150},
    init_options = config
}, {})))

local cfg = nvim_lsp.tsserver
if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
    print(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
end
