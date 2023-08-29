return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
		},
	},
	config = function()
		local dap, dap_ui = require("dap"), require("dapui")

		dap_ui.setup()
		dap.set_log_level("INFO")

		local js_config = {
			{
				type = "node2",
				name = "Launch",
				request = "launch",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
			{
				type = "node2",
				name = "Attach",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
		}

		dap.configurations = {
			javascript = js_config,
			typescript = js_config,
		}

		dap.adapters = {
			node2 = {
				type = "executable",
				command = "node",
				args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
			},
		}

		vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dap_ui.open({ reset = true })
		end
		dap.listeners.before.event_terminated["dapui_config"] = dap_ui.close
		dap.listeners.before.event_exited["dapui_config"] = dap_ui.close
	end,
}
