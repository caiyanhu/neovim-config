vim.pack.add({
  { src = "https://github.com/catppuccin/nvim.git", name = "catppuccin" },
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  {
    src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = vim.version.range("3"),
  },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/RRethy/vim-illuminate" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/mfussenegger/nvim-lint" },
  { src = "https://github.com/nvim-mini/mini.comment" },
  { src = "https://github.com/nvim-mini/mini.pairs" },
  { src = "https://github.com/numToStr/FTerm.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/rainbowhxch/accelerated-jk.nvim" },
  { src = "https://github.com/MattesGroeger/vim-bookmarks" },
  { src = "https://github.com/pmizio/typescript-tools.nvim" },
  { src = "https://github.com/brenoprata10/nvim-highlight-colors" },

  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

vim.cmd.colorscheme("catppuccin")

-- auto tag
require("nvim-ts-autotag").setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false, -- Auto close on trailing </
  },
})

-- treesitter
require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "c",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  modules = {},
})

-- neo-tree
require("neo-tree").setup({})
vim.keymap.set({ "n", "v" }, "<leader>e", function()
  vim.cmd("Neotree toggle")
end)

-- conform
local langs_use_prettier = {
  "css",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "jsonc", -- for example: tsconfig.json
  "json5",
  "less",
  "sass",
  "scss",
  "typescript",
  "typescriptreact",
  "vue",
  "yaml",
}
local formatters = {}
for _, name in pairs(langs_use_prettier) do
  formatters[name] = { "prettier" }
end
formatters["lua"] = { "stylua" }
formatters["rust"] = { "rustfmt" }
formatters["toml"] = { "taplo" }
formatters["python"] = { "ruff_format" }

require("conform").setup({
  format_on_save = {
    timeout_ms = 2500,
    lsp_fallback = true,
  },
  formatters_by_ft = formatters,
})

-- Improved fzf.vim written in lua
-- find file in all files
vim.keymap.set({ "n", "v" }, "<C-p>", function()
  vim.cmd("FzfLua files")
end)
-- show all buffers
vim.keymap.set({ "n", "v" }, "<leader><space>", function()
  vim.cmd("FzfLua buffers")
end)
-- find text in all files
vim.keymap.set({ "n", "v" }, "<leader>g", function()
  vim.cmd("FzfLua live_grep")
end)
-- resume last grep
vim.keymap.set({ "n", "v" }, "<leader>r", function()
  vim.cmd("FzfLua resume")
end)
-- old files
vim.keymap.set({ "n", "v" }, "<leader>?", function()
  vim.cmd("FzfLua oldfiles")
end)
-- lsp code actions
vim.keymap.set({ "n", "v" }, "<leader>ca", function()
  vim.cmd("FzfLua lsp_code_actions")
end)
-- search in folder
vim.keymap.set("n", "<leader>sf", function()
  vim.cmd("SearchInFolder")
end, { desc = "Search in folder (fzf-lua)" })

-- git signs
require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 300,
  },
})

-- automatically highlighting other uses of the word under the cursor
require("illuminate").configure()

-- A snazzy bufferline for Neovim
vim.opt.termguicolors = true
require("bufferline").setup({})

-- status line
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
  extensions = { "neo-tree", "lazy" },
})

-- lint
local linters = {
  css = { "stylelint" },
  javascript = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  python = { "ruff" },
}
local languages_to_lint = {
  "css",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "lua",
  "rust",
  "typescript",
  "typescriptreact",
  "vue",
}
for _, name in pairs(languages_to_lint) do
  if not linters[name] then
    linters[name] = { "cspell" }
  end
  if not vim.tbl_contains(linters[name], "cspell") then
    table.insert(linters[name], "cspell")
  end
end
require("lint").linters_by_ft = linters

-- mini
require("mini.comment").setup()
require("mini.pairs").setup()

-- terminal
require("FTerm").setup({
  border = "double",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})
vim.keymap.set("n", "<A-`>", require("FTerm").toggle)
vim.keymap.set("t", "<A-`>", function()
  vim.cmd("stopinsert")
  require("FTerm").toggle()
end)

-- todo
require("todo-comments").setup()
vim.keymap.set("n", "<leader>td", function()
  vim.cmd("TodoFzfLua")
end)

-- diagnostics, references, quickfix and location list
require("trouble").setup()
vim.keymap.set("n", "<leader>xx", function()
  vim.cmd("Trouble diagnostics toggle")
end, { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xl", function()
  vim.cmd("Trouble loclist toggle")
end, { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xq", function()
  vim.cmd("Trouble qflist toggle")
end, { desc = "Quickfix List (Trouble)" })

-- jk加速
vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")

-- bookmark
vim.g.bookmark_sign = "🎯"
vim.g.bookmark_highlight_lines = 1
-- 默认快捷键: mm增加书签 mn下一个书签 mp上一个书签 mx删除所有书签 mc删除当前buffer的所有书签

-- 不使用typescript-language-server, typescript-tool速度更快
require("typescript-tools").setup({
  filetypes = { "javascript", "typescript" },
})

-- show color
require("nvim-highlight-colors").setup({})
