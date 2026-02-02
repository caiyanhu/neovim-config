-- 执行系统命令并返回输出（去首尾空白）
local function exec_cmd(cmd)
  local f = io.popen(cmd, "r")
  if not f then
    return nil
  end
  local res = f:read("*a")
  f:close()
  if res then
    res = res:gsub("^%s+", ""):gsub("%s+$", "")
  end
  return res
end

-- 判断操作系统与芯片架构
local function check_os_and_arch()
  local os_name = exec_cmd("uname -s")
  local result = {
    os = "unknown",
    arch = "unknown",
    chip = "unknown",
  }

  if os_name == "Darwin" then
    result.os = "MacOS"
    local arch = exec_cmd("uname -m")
    result.arch = arch

    if arch == "arm64" then
      result.chip = "apple_silicon"
    elseif arch == "x86_64" then
      result.chip = "intel"
    else
      result.chip = "unknown"
    end
  elseif os_name == "Linux" then
    result.os = "Linux"
    result.arch = exec_cmd("uname -m")
    result.chip = "unknown"
  else
    local os_win = exec_cmd("ver")
    if os_win and os_win:find("Windows") then
      result.os = "Windows"
      result.arch = exec_cmd("echo %PROCESSOR_ARCHITECTURE%")
      result.chip = "unknown"
    else
      result.os = "unknown"
    end
  end

  return result
end

local sys_info = check_os_and_arch()

local isAppleSiliconMac = sys_info.os == "MacOS" and sys_info.chip == "apple_silicon"
local isIntelMac = sys_info.os == "MacOS" and sys_info.chip == "intel"

-- 创建模块导出表，暴露需要外部访问的变量
local M = {}
M.isAppleSiliconMac = isAppleSiliconMac
M.isIntelMac = isIntelMac

-- 返回模块表，供外部 require 调用
return M
