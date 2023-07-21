local status, autoPairs = pcall(require, "mini.pairs")
if not status then
	return
end

autoPairs.setup()
