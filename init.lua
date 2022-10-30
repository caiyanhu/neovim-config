require("user.base")
require("user.highlights")
require("user.maps")
require("user.utils")
require("user.plugins")

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require("user.macos")
end

if is_win then
  require("user.windows")
end
