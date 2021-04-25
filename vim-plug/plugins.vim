" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " golang support for vim
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Intelisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " theme
  Plug 'rakr/vim-one'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " file explorer
  Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
  " add  file icons to defx
  Plug 'kristijanhusak/defx-icons'
  "generic finder and dispactcher
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

  " switch input method
  Plug 'ybian/smartim'

  " git releated plugins
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " git blame
  Plug 'apzelos/blamer.nvim'

  " surroundings
  Plug 'tpope/vim-surround'
  " 缩进对齐线
  Plug 'Yggdroot/indentLine'
  " start screen for vim
  Plug 'mhinz/vim-startify' 
  " color highlighter
  Plug 'norcalli/nvim-colorizer.lua'
  " spell check
  Plug 'kamykn/spelunker.vim'
  " language syntax highlight
  Plug 'sheerun/vim-polyglot'
call plug#end()
