cnoreabbrev Ack Ack!
nnoremap <Leader>F :Ack!<Space>

if executable('ag')
    let g:ackprg  = 'ag --vimgrep --nogroup --column'
endif
