local parsers = {
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
}

require("nvim-treesitter").install(parsers)

local function start_highlight(buffer)
  if not vim.api.nvim_buf_is_valid(buffer) or not vim.api.nvim_buf_is_loaded(buffer) then
    return
  end
  if vim.treesitter.highlighter.active[buffer] then
    return
  end
  pcall(vim.treesitter.start, buffer)
end

local treesitter_group = vim.api.nvim_create_augroup("ConfigTreesitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = treesitter_group,
  pattern = {
    "c",
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "python",
    "query",
    "rust",
    "scss",
    "toml",
    "typescript",
    "typescriptreact",
    "vim",
    "vue",
    "yaml",
  },
  callback = function(event)
    start_highlight(event.buf)
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = treesitter_group,
  pattern = "TSUpdate",
  callback = function()
    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
      start_highlight(buffer)
    end
  end,
})

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
})
