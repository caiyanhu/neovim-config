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

-- 定义命令 :SearchInFolder
vim.api.nvim_create_user_command("SearchInFolder", function()
  local fzf = require("fzf-lua")
  -- 弹出输入框，默认路径是当前工作目录，支持目录补全
  local path = vim.fn.input("📁 Search in folder: ", vim.fn.getcwd(), "dir")
  if path == "" then
    print("❌ No folder specified, canceled.")
    return
  end

  -- 展开 ~ 并执行搜索
  path = vim.fn.expand(path)
  if vim.fn.isdirectory(path) == 0 then
    print("⚠️ Not a valid directory: " .. path)
    return
  end

  print("🔍 Searching in: " .. path)
  fzf.live_grep({ cwd = path })
end, { desc = "Search texts in specified folder using fzf-lua" })

-- 定义命令 :BufOnly
vim.api.nvim_create_user_command("BufOnly", function()
  vim.cmd("silent! %bd|e#|bd#")
end, { desc = "Close all buffers in Neovim EXCEPT the current one" })
