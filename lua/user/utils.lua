function Nvim_Create_Augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

local autocmds = {
	-- Autocommand that reloads neovim whenever you save the plugins.lua file
	packer_user_conifg = {
		{
			"BufWritePost",
			"plugins.lua",
			"source <afile> | PackerSync",
		},
	},
	-- enable emmet just for html/css/less
	enable_emmet_for_specific_types = {
		{
			"FileType",
			"html,css,less",
			"EmmetInstall",
		},
	},
	-- configure .jsx files so jsx is included in the filetype
	enable_jsx_files = {
		{
			"BufNewFile,BufRead",
			"*.jsx",
			"set filetype=javascript.jsx",
		},
	},
	-- configure .tsx files so tsx is included in the filetype
	enable_tsx_files = {
		{
			"BufNewFile,BufRead",
			"*.tsx",
			"set filetype=typescriptreact",
		},
	},
}

Nvim_Create_Augroups(autocmds)
