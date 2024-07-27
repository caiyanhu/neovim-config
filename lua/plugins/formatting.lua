return {
  {
    'stevearc/conform.nvim',
    cond = not vim.g.vscode,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local langs_use_prettier = {
        'css',
        'html',
        'javascript',
        'javascriptreact',
        'json',
        'jsonc', -- for example: tsconfig.json
        'json5',
        'less',
        'sass',
        'scss',
        'typescript',
        'typescriptreact',
        'vue',
        'yaml',
      }
      local formatters = {}
      for _, name in pairs(langs_use_prettier) do
        formatters[name] = { 'prettier' }
      end
      formatters['lua'] = { 'stylua' }
      formatters['rust'] = { 'rustfmt' }
      formatters['toml'] = { 'taplo' }

      require('conform').setup {
        formatters_by_ft = formatters,
      }
    end,
  },
}
