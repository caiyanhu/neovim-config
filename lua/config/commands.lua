local reload_group = vim.api.nvim_create_augroup("ConfigAutoReload", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = reload_group,
  command = "checktime",
})

vim.api.nvim_create_user_command("SearchInFolder", function()
  local path = vim.fn.input("📁 Search in folder: ", vim.fn.getcwd(), "dir")
  if path == "" then
    return
  end

  path = vim.fn.expand(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.notify("Not a valid directory: " .. path, vim.log.levels.WARN)
    return
  end

  require("fzf-lua").live_grep({ cwd = path })
end, { desc = "Search text in a specified folder with fzf-lua" })

vim.api.nvim_create_user_command("BufOnly", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if buffer ~= current and vim.api.nvim_buf_is_loaded(buffer) then
      pcall(vim.api.nvim_buf_delete, buffer, {})
    end
  end
end, { desc = "Close all loaded buffers except the current one" })
