-- debug配置
local status, dap = pcall(require, "dap")
if not status then
	return
end

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/local/opt/llvm/bin/lldb-vscode",
	name = "lldb",
}

local lldb = {
	name = "Launch Debug",
	type = "lldb",
	request = "launch",
	program = function()
		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/" .. "")
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	initCommand = {},
	runInTerminal = false,
}

dap.configurations.rust = {
	lldb,
}
