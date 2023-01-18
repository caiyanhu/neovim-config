local status_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end
local rust_tools_status, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status then
	return
end
-- Change Severity signs in nvim lsp diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } -- Default: E W H I
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
mason_lsp_config.setup({
	-- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
	-- This setting has no relation with the `automatic_installation` setting.
	ensure_installed = { "sumneko_lua" },
	-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	-- This setting has no relation with the `ensure_installed` setting.
	-- Can either be:
	--   - false: Servers are not automatically installed.
	--   - true: All servers set up via lspconfig are automatically installed.
	--   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
	--       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	automatic_installation = false,
})

-- automatically set up LSP servers installed via `mason.nvim` without having to
-- manually add each server setup to your Neovim configuration. It also makes it
-- possible to use newly installed servers without having to restart Neovim!

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = {
	capabilities = capabilities,
}

mason_lsp_config.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		nvim_lsp[server_name].setup(opts)
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	["jsonls"] = function()
		local json_opts = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		}
		opts = vim.tbl_deep_extend("force", json_opts, opts)
		nvim_lsp["jsonls"].setup(opts)
	end,
	["volar"] = function()
		local os_name = vim.loop.os_uname().sysname
		local path = ""
		if os_name == "Darwin" then
			path = "/usr/local/lib"
		elseif os_name == "Linux" then
			path = "/usr/lib"
		end
		local volar_opts = {
			init_options = {
				typescript = {
					tsdk = path .. "/node_modules/typescript/lib", -- Alternative location if installed as root:
				},
			},
		}
		opts = vim.tbl_deep_extend("force", volar_opts, opts)
		nvim_lsp["volar"].setup(opts)
	end,
	["sumneko_lua"] = function()
		local lua_opts = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		}
		opts = vim.tbl_deep_extend("force", lua_opts, opts)
		nvim_lsp["sumneko_lua"].setup(opts)
	end,
	["rust_analyzer"] = function()
		rust_tools.setup({})
	end,
})
