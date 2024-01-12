return {
  {
    'mfussenegger/nvim-lint',
    cond = not vim.g.vscode,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local linters = {
        css = { 'stylelint' },
        javascript = { 'eslint' },
        typescript = { 'eslint' },
        typescriptreact = { 'eslint' },
      }
      local languages = {
        'css',
        'html',
        'javascript',
        'javascriptreact',
        'json',
        'lua',
        'rust',
        'typescript',
        'typescriptreact',
        'vue',
      }
      for _, name in pairs(languages) do
        if not linters[name] then
          linters[name] = { 'cspell' }
        end
        if not vim.tbl_contains(linters[name], 'cspell') then
          table.insert(linters[name], 'cspell')
        end
      end

      local lint = require 'lint'
      lint.linters_by_ft = linters

      local lint_au_group =
        vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd(
        { 'BufEnter', 'BufWritePost', 'InsertLeave' },
        {
          group = lint_au_group,
          callback = function()
            lint.try_lint(nil, {
              ignore_errors = true, -- ignore command-not-found errors
            })
          end,
        }
      )
    end,
  },
}
