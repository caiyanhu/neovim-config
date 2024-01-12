return {
  {
    'mrcjkb/rustaceanvim',
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
