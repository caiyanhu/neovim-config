return {
	type = "server",
	host = "127.0.0.1",
	port = "${port}",
	executable = {
		command = "~/tools/codelldb",
		args = { "--port", "${port}" },
	},
}
