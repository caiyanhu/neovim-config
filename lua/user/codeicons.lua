local status_ok, icon = pcall(require, "codicons")
if not status_ok then
  return
end

icon.setup({
  -- Override by mapping name to icon
  ["account"] = "",
})
