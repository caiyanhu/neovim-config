return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Color scheme
    use {'drewtempelmeyer/palenight.vim'}

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- LSP and completion
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    use {'kabouzeid/nvim-lspinstall'}

    -- LSP completion items icons
    use {"onsails/lspkind-nvim"}

    -- LSP UI
    use {'glepnir/lspsaga.nvim'}

    -- Tree Sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- File Explorer
    use {
        'kyazdani42/nvim-web-devicons',
        'kyazdani42/nvim-tree.lua'
    }

    -- JavaScript and JSX syntax Highlighter
    use {
        'yuezk/vim-js',
        'MaxMEllon/vim-jsx-pretty'
    }

    -- Lualine
    use {'hoob3rt/lualine.nvim'}

    -- Auto Pairs
    use {'windwp/nvim-autopairs'}
    use {'p00f/nvim-ts-rainbow'}

    -- Comment
    use {'b3nj5m1n/kommentary'}

    -- Git Blammer and Git Sign
    use {'f-person/git-blame.nvim'}
    use {'mhinz/vim-signify'}

    -- Color Highlighter
    use {'norcalli/nvim-colorizer.lua'}

    -- Emmet
    use {'mattn/emmet-vim'}

    -- Linter And Prettier
    use {'dense-analysis/ale'}

    -- Surround
    use {'tpope/vim-surround'}

    -- Snippets
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}

    -- jump anywhere
    use {'phaazon/hop.nvim'}

    -- Floating Terminal Plugin
    use {'numToStr/FTerm.nvim'}

    -- Highlight, List and Search todo comments
    use {'folke/todo-comments.nvim'}

    -- Spell Check
    use {'kamykn/spelunker.vim'}
end)
