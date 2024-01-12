return {
  'nvimdev/lspsaga.nvim',
  config = function()
    local keymap = vim.keymap

    require('lspsaga').setup {
      ui = {
        border = 'rounded',
      },
      lightbulb = {
        enable = false,
      },
    }

    keymap.set('n', '[d', '<CMD>Lspsaga diagnostic_jump_prev<CR>')
    keymap.set('n', ']d', '<CMD>Lspsaga diagnostic_jump_next<CR>')
    keymap.set('n', '<leader>o', '<CMD>Lspsaga outline<CR>')

    local builtin = require 'telescope.builtin'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        keymap.set('n', 'gd', '<CMD>Lspsaga goto_definition<CR>', opts)
        keymap.set('n', 'gr', '<CMD>Lspsaga rename<CR>', opts)
        keymap.set(
          { 'n', 'v' },
          '<space>ca',
          '<CMD>Lspsaga code_action<CR>',
          opts
        )
        keymap.set('n', 'gR', builtin.lsp_references, opts)
      end,
    })

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

    vim.keymap.set('n', '<space>k', show_documentation, { silent = true })

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
