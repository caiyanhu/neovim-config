local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

require("packer").startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("p00f/nvim-ts-rainbow") -- Rainbow parentheses for neovim using tree-sitter
	use("nvim-tree/nvim-web-devicons") -- 用于在nvim-tree中显示文件图标
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

	-- neo-tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
	})

	-- ui
	use({ "stevearc/dressing.nvim" })

	-- formatters and linters
	use("dense-analysis/ale")

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Auto pairs and tags
	use({ "echasnovski/mini.pairs", branch = "stable" })
	use("windwp/nvim-ts-autotag")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- Emmet
	use("mattn/emmet-vim")

	-- Float Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	-- JSON Schema Store
	use("b0o/schemastore.nvim")

	-- Preview color
	use("norcalli/nvim-colorizer.lua")

	-- Snippet
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
	}) -- Snippets plugin
	use("rafamadriz/friendly-snippets")

	-- Bookmark
	use("MattesGroeger/vim-bookmarks")

	-- the silver searcher, A.K.A ag
	use("Numkil/ag.nvim")

	-- todo-comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- 自动记忆当前文件位置,下次打开时定位到上次的位置
	use("ethanholz/nvim-lastplace")

	-- search and replace like vscode
	use("AckslD/muren.nvim")

	-- markdown
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
