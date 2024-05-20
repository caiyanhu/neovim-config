return {
  'nvimdev/lspsaga.nvim',
  cond = not vim.g.vscode,
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup {
      ui = {
        border = 'rounded',
        devicon = true,
        expand = '⊞',
        collapse = '⊟',
        code_action = '💡',
        imp_sign = '󰳛 ',
        actionfix = ' ',
      },
      lightbulb = {
        enable = false, -- Automatically show lightbulbs when the current line has available code actions.
        sign = true, -- show sign in status column
        virtual_text = false, -- Don't show virtual text at the end of line
      },
    }

    local keymap = vim.keymap
    local builtin = require 'telescope.builtin'
    keymap.set('n', 'gd', '<CMD>Lspsaga goto_definition<CR>')
    keymap.set('n', 'gr', '<CMD>Lspsaga rename<CR>')
    keymap.set({ 'n', 'v' }, '<space>ca', '<CMD>Lspsaga code_action<CR>')
    keymap.set('n', '<leader>o', '<CMD>Lspsaga outline<CR>')
    keymap.set('n', 'gR', builtin.lsp_references)
    keymap.set('n', '<leader>da', builtin.diagnostics)
    keymap.set('n', 'gi', builtin.lsp_implementations)

    -- for crates.nvim
    local function show_documentation()
      local filetype = vim.bo.filetype
      if vim.tbl_contains({ 'vim', 'help' }, filetype) then
        vim.cmd('h ' .. vim.fn.expand '<cword>')
      elseif vim.tbl_contains({ 'man' }, filetype) then
        vim.cmd('Man ' .. vim.fn.expand '<cword>')
      elseif
        vim.fn.expand '%:t' == 'Cargo.toml'
        and require('crates').popup_available()
      then
        require('crates').show_popup()
      else
        vim.cmd 'Lspsaga hover_doc'
      end
    end

    keymap.set('n', 'K', show_documentation, { silent = true })

    -- error lens
    vim.fn.sign_define {
      {
        name = 'DiagnosticSignError',
        text = '',
        texthl = 'DiagnosticSignError',
        linehl = 'ErrorLine',
      },
      {
        name = 'DiagnosticSignWarn',
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'WarningLine',
      },
      {
        name = 'DiagnosticSignInfo',
        text = '',
        texthl = 'DiagnosticSignInfo',
        linehl = 'InfoLine',
      },
      {
        name = 'DiagnosticSignHint',
        text = '',
        texthl = 'DiagnosticSignHint',
        linehl = 'HintLine',
      },
    }
  end,
}
