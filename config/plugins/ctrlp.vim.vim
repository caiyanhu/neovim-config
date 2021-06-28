let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'

let g:ctrlp_max_files = 0

nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fb :CtrlPBuffer<CR>
