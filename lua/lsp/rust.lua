return {
  {
    'mrcjkb/rustaceanvim',
    cond = not vim.g.vscode,
    version = '^3', -- Recommended
    ft = { 'rust' },
    dependencies = {
      'saecki/crates.nvim',
      tag = 'stable',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('crates').setup()
    end,
  },
}
