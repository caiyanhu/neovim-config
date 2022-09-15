local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("p00f/nvim-ts-rainbow") -- Rainbow parentheses for neovim using tree-sitter
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("nvim-lualine/lualine.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	-- Colorschemes
	use("yong1le/darkplus.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- vim command completion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("onsails/lspkind.nvim") -- icons on the completion popups

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer")

	-- formatters and linters
	use("dense-analysis/ale")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	local os_name = vim.loop.os_uname().sysname
	if os_name == "Linux" then
		-- This plugin only support on Linux
		use("nvim-telescope/telescope-media-files.nvim")
	end

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Auto Pairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
	})

	-- Emmet
	use("mattn/emmet-vim")

	-- Float Terminal
	use("voldikss/vim-floaterm")

	-- JSON Schema Store
	use("b0o/schemastore.nvim")

	-- preview color
	use("norcalli/nvim-colorizer.lua")

	-- Snippet
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")

	-- Fold
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- Bookmark
	use("MattesGroeger/vim-bookmarks")

	-- Pretty Quickfix Window
	use("folke/trouble.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
