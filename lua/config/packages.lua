local pack_group = vim.api.nvim_create_augroup("ConfigPackHooks", { clear = true })

vim.api.nvim_create_autocmd("PackChanged", {
  group = pack_group,
  callback = function(event)
    local data = event.data
    if data.kind ~= "update" or data.spec.name ~= "nvim-treesitter" then
      return
    end

    vim.schedule(function()
      if not data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      require("nvim-treesitter").update():wait(300000)
    end)
  end,
})

vim.pack.add({
  -- Shared dependencies. vim.pack does not resolve dependencies automatically.
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",

  -- LSP and completion.
  { src = "https://github.com/neovim/nvim-lspconfig.git" },
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.7.0" },
  { src = "https://github.com/b0o/SchemaStore.nvim" },
  { src = "https://github.com/nvimdev/lspsaga.nvim" },

  -- Treesitter and editing.
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-mini/mini.pairs" },

  -- Navigation and UI.
  { src = "https://github.com/catppuccin/nvim.git", name = "catppuccin" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3") },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/RRethy/vim-illuminate" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/numToStr/FTerm.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/rainbowhxch/accelerated-jk.nvim" },
  { src = "https://github.com/MattesGroeger/vim-bookmarks" },
  { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
})
