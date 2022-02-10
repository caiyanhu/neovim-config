local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.neovim/plugins')
-- Color Scheme
Plug 'dracula/vim'
-- Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- LSP Config
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

-- Completion
Plug ('neoclide/coc.nvim', {branch = 'release'})

-- LSP UI
Plug 'glepnir/lspsaga.nvim'

-- Tree Sitter
Plug ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

-- File Explorer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

-- JavaScript and JSX syntax Highlighter
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'yuezk/vim-js' 

-- List for showing diagnostics, references,telescope results,quickfix and location lists
Plug 'folke/trouble.nvim'

-- Lualine
Plug 'hoob3rt/lualine.nvim'

-- Auto Pairs
Plug 'windwp/nvim-autopairs'
Plug 'p00f/nvim-ts-rainbow'

-- Comment
Plug 'numToStr/Comment.nvim'

-- Git Blammer and Git Sign
Plug 'f-person/git-blame.nvim'
Plug 'mhinz/vim-signify'

-- Color Highlighter
Plug 'norcalli/nvim-colorizer.lua'

-- Emmet
Plug 'mattn/emmet-vim'

-- Linter And Prettier
Plug 'dense-analysis/ale'

-- Surround
Plug 'tpope/vim-surround'

-- Snippets
Plug 'hrsh7th/vim-vsnip' 
Plug 'hrsh7th/vim-vsnip-integ'

-- jump anywhere
Plug 'phaazon/hop.nvim'

-- Highlight, List and Search todo comments
Plug 'folke/todo-comments.nvim'

-- Spell Check
Plug 'kamykn/spelunker.vim'

-- Debug
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

-- smooth scrolling plugin
Plug 'karb94/neoscroll.nvim'

-- Floating Terminal
Plug 'numToStr/FTerm.nvim'
vim.call('plug#end')
