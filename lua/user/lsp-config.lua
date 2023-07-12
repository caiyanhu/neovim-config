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

-- Add additional capabilities supported by nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()
local os_name = vim.loop.os_uname().sysname

local LuaRuntime = {
	version = "Lua 5.4",
	path = {
		"?/init.lua",
	},
}
if os_name == "Linux" then
	LuaRuntime = {
		version = "LuaJIT",
	}
end

-- lua的配置
local lua_ls_opts = {
	settings = {
		Lua = {
			runtime = LuaRuntime,
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false, -- stop lua_ls asks about working environment on every startup
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

-- volar的配置
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

-- jsonls的配置
local jsonls_opts = {
	settings = {
		json = {
			schemas = schemaStore.json.schemas(),
			validate = { enable = true },
		},
	},
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "lua_ls", "tsserver", "volar", "jsonls", "html", "cssls", "rust_analyzer", "taplo", "dockerls" }
-- jsonls html cssls在archlinux下均通过pacman安装 https://aur.archlinux.org/packages/vscode-langservers-extracted
-- rust_analyzer是通过rustup component add rust-src安装
for _, lsp in ipairs(servers) do
	local opts = {
		capabilities = capabilities,
	}
	if lsp == "lua_ls" then
		opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
	end
	if lsp == "volar" then
		opts = vim.tbl_deep_extend("force", volar_opts, opts)
	end
	if lsp == "jsonls" then
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end
	lsp_config[lsp].setup(opts)
end
