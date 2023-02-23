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
packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("p00f/nvim-ts-rainbow") -- Rainbow parentheses for neovim using tree-sitter
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("mortepau/codicons.nvim") -- vscode icons, for lsp-kind
	use("kyazdani42/nvim-tree.lua")
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("lukas-reineke/indent-blankline.nvim")

	-- Colorschemes
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- Completion
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/cmp-path") -- nvim-cmp source for path
	use("onsails/lspkind-nvim") -- vscode-like pictograms

	-- LSP
	use("neovim/nvim-lspconfig") -- LSP
	use("glepnir/lspsaga.nvim") -- LSP UIs
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- formatters and linters
	use("dense-analysis/ale")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Auto pairs and tags
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- Emmet
	use("mattn/emmet-vim")

	-- Float Terminal
	use("voldikss/vim-floaterm")

	-- JSON Schema Store
	use("b0o/schemastore.nvim")

	-- Preview color
	use("norcalli/nvim-colorizer.lua")

	-- Snippet
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Fold
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- Bookmark
	use("MattesGroeger/vim-bookmarks")

	-- Rust
	use("simrat39/rust-tools.nvim")

	-- the silver searcher, A.K.A ag
	use("Numkil/ag.nvim")

	-- Extends the default quickfix and location lists
	use({ "kevinhwang91/nvim-bqf" })
	use({ "junegunn/fzf" })

	-- motions on speed
	use("rlane/pounce.nvim")
	-- todo-comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- debug adapter protocal client
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")

	---- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
