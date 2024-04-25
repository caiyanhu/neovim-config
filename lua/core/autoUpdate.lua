-- repeat command checktime every 1 second
function CheckUpdate()
  vim.cmd 'checktime'
  vim.fn.timer_start(1000, CheckUpdate)
end

if not vim.g.CheckUpdateStarted then
  vim.g.CheckUpdateStarted = 1
  vim.fn.timer_start(1, CheckUpdate)
end
