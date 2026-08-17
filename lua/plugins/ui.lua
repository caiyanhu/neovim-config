vim.cmd.colorscheme("catppuccin")

require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_opts = { delay = 300 },
})

require("illuminate").configure()
require("bufferline").setup({})

require("lualine").setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { { "filename", path = 3 } },
    lualine_x = { "diagnostics" },
    lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      function()
        return " " .. os.date("%R")
      end,
    },
  },
  extensions = { "neo-tree" },
})
