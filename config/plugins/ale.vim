nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'


" Fix files automatically on save
let g:ale_fix_on_save = 1

let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'css': ['eslint'],
      \ 'typescript': ['eslint'],
      \ }
let g:ale_linters_explicit = 1
