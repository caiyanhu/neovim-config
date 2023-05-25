local status, lastPlace = pcall(require, "nvim-lastplace")
if not status then
	return
end

lastPlace.setup({
	lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
	lastplace_ignore_filetype = { "gitcommit", "gitrebase", "hgcommit" },
	lastplace_open_folds = true,
})
