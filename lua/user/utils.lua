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
	-- no highlight search while cursor hold
	no_hlsearch_cursor_hold = {
		{
			"cursorhold",
			"*",
			"set nohlsearch",
		},
	},
}

Nvim_Create_Augroups(autocmds)
