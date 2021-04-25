source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/keys/mappings.vim
" themes
source $HOME/.config/nvim/themes/airline.vim
" file explorer
source $HOME/.config/nvim/plug-config/defx.vim
" find files
source $HOME/.config/nvim/plug-config/vim-clap.vim
" smartim
source $HOME/.config/nvim/plug-config/startim.vim
" git gutter
source $HOME/.config/nvim/plug-config/gitgutter.vim
" git blame
source $HOME/.config/nvim/plug-config/blamer.vim
" coc config
source $HOME/.config/nvim/plug-config/coc.vim
" indent line
source $HOME/.config/nvim/plug-config/identline.vim

lua require'colorizer'.setup()
