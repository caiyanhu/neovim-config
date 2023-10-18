return {
  {
    "numToStr/FTerm.nvim",
    keys = {
      {
        "<A-`>",
        function()
          require("FTerm").toggle()
        end,
      },
      {
        "<A-`>",
        "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>",
        mode = "t",
      },
    },
    opts = {},
  },
}
