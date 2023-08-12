return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorschem
    priority = 1000, -- make sure to load this before all the other start plugin
    dependencies = {
      'nvim-lualine/lualine.nvim',
      'nvim-tree/nvim-web-devicons',
      "utilyre/barbecue.nvim",
      "SmiteshP/nvim-navic",
    },
    config = function()
      vim.cmd([[colorscheme tokyonight-storm]])
      require("lualine").setup({
        options = { theme = "tokyonight" },
      })
      require("barbecue").setup({
        theme = "tokyonight"
      })
    end,
  },
}
