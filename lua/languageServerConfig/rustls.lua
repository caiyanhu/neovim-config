-- rust-analyzer这个lsp可以通过brew安装
require('lspconfig').rust_analyzer.setup {
  require('coq').lsp_ensure_capabilities({
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
  })
}
vim.cmd('COQnow -s')
