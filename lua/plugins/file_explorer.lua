return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle<CR>",
        desc = "Open the neo-tree",
        mode = { "n", "v" },
      },
    },
    config = true,
  },
}
