-- 进入和写入 buffer 时执行 lint
vim.api.nvim_create_augroup("LintAutogroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = "LintAutogroup",
  callback = function()
    -- 执行 lint 检查
    require("lint").try_lint()
  end,
})

-- 当文件在外部被修改（如 git checkout）时，自动重新加载
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})
