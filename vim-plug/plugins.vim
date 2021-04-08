" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " theme
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " file explorer"
    Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
    " add  file icons to defx"
    Plug 'kristijanhusak/defx-icons'
    "generic finder and dispactcher"
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    " switch input method"
    Plug 'ybian/smartim'
call plug#end()
