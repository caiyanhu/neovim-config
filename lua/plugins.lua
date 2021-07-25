return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Color scheme
    use {'kaicataldo/material.vim'}

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- LSP and completion
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    
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

    -- GoLang support
    use {
        'fatih/vim-go',
        run = ':GoUpdateBinaries'
    }

    -- Lualine
    use {'hoob3rt/lualine.nvim'}

    -- Auto Pairs
    use {'windwp/nvim-autopairs'}

    -- Comment
    use {'b3nj5m1n/kommentary'}

    -- Git Blammer and Git Sign
    use {'f-person/git-blame.nvim'}
    use {'lewis6991/gitsigns.nvim'}

    -- Color Highlighter
    use {'norcalli/nvim-colorizer.lua'}

    -- Formater
    use {'mhartington/formatter.nvim'}

    -- Emmet
    use {'mattn/emmet-vim'}

    -- Surround
    use {'tpope/vim-surround'}

    -- Snippets
    use {'hrsh7th/vim-vsnip'}
end)
