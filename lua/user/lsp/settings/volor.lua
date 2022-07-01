local os_name = vim.loop.os_uname().sysname
local path = ""
if os_name == "Darwin" then
	path = "/usr/local/lib"
elseif os_name == "Linux" then
	path = "/usr/lib"
end

return {
	init_options = {
		typescript = {
			serverPath = path .. "/node_modules/typescript/lib/tsserverlibrary.js", -- Alternative location if installed as root:
		},
	},
}
