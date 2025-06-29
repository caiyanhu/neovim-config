return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      {
        -- find file in all files
        '<C-p>',
        "<CMD>lua require('fzf-lua').files()<CR>",
      },
      {
        -- show all buffers
        '<leader><space>',
        "<CMD>lua require('fzf-lua').buffers()<CR>",
      },
      {
        -- find text in all files
        '<leader>g',
        "<CMD>lua require('fzf-lua').live_grep()<CR>",
      },
      { '<leader>?', "<CMD>lua require('fzf-lua').oldfiles()<CR>" },
      {
        -- go to the definition
        'gd',
        "<CMD>lua require('fzf-lua').lsp_definitions()<CR>",
      },
      {
        -- go to the references
        'gR',
        "<CMD>lua require('fzf-lua').lsp_references()<CR>",
      },
      {
        -- lsp code actions
        '<leader>ca',
        "<CMD>lua require('fzf-lua').lsp_code_actions()<CR>",
      },
    },
  },
}
