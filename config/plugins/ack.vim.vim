cnoreabbrev Ack Ack!
nnoremap <Leader>F :Ack!<Space>

if executable('ag')
    let g:ackprg  = 'ag --vimgrep --nogroup --column'
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif
