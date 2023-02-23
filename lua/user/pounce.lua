local status, pounce = pcall(require, "pounce")
if not status then
	return
end

pounce.setup({
	accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
	accept_best_key = "<enter>",
	multi_window = true,
	debug = false,
})
