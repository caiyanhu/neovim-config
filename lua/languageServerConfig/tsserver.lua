require('lspconfig').tsserver.setup {
  require('coq').lsp_ensure_capabilities({})
}
vim.cmd('COQnow -s')
