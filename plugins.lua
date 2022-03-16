vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Fuzzy finder
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  
  -- LSP Config
  use {'neovim/nvim-lspconfig'}
  
  -- File Explorer
  use {'kyazdani42/nvim-tree.lua', requires = {
    'kyazdani42/nvim-web-devicons' 
  }, config = function() require'nvim-tree'.setup {} end
}

  -- completion
  use {'neoclide/coc.nvim', branch = 'release'}
  
  -- Auto Pairs
  use {'windwp/nvim-autopairs'}
  
  -- Comment
  use {'numToStr/Comment.nvim', config = function()
    require('Comment').setup()
  end
 }
  
  -- Git Blammer and Git Sign
  use {'f-person/git-blame.nvim'}
  use {'mhinz/vim-signify'}

  -- Emmet
  use {'mattn/emmet-vim'}
  
end)
