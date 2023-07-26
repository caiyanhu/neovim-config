local status, lsp_config = pcall(require, "lspconfig")
if not status then
	return
end
local status_lsp_source, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_lsp_source then
	return
end
local has_scheme_store, schemaStore = pcall(require, "schemastore")
if not has_scheme_store then
	return
end

local os_name = vim.loop.os_uname().sysname

local volarRoot = ""
if os_name == "Darwin" then
	volarRoot = "/usr/local/lib"
elseif os_name == "Linux" then
	volarRoot = "/usr/lib"
end

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	},
	volar = {
		init_options = {
			typescript = {
				tsdk = volarRoot .. "/node_modules/typescript/lib", -- Alternative location if installed as root:
			},
		},
	},
	jsonls = {
		settings = {
			json = {
				schemas = schemaStore.json.schemas(),
				validate = { enable = true },
			},
		},
	},
	tsserver = {},
	dockerls = {},
}

local function lsp_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	cmp_nvim_lsp.default_capabilities(capabilities)
end

local function lsp_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			if args.data == nil then
				return
			end
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, bufnr)
		end,
	})
end

lsp_attach(function(client, buffer)
	require("user.lsp.format").on_attach(client, buffer)
	require("user.lsp.keymaps").on_attach(client, buffer)
end)

local serverNames = { "lua_ls", "tsserver", "volar", "jsonls", "dockerls", "cssls", "html" }
for _, server in ipairs(serverNames) do
	local opts = servers[server] or {}
	opts.capabilities = lsp_capabilities()
	lsp_config[server].setup(opts)
end
