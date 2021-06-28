let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['eslint'],
            \ 'html': ['prettier'],
            \ 'css': ['stylelint']
            \}
let g:ale_linters = {
            \ 'css': ['stylelint']
            \}
let g:alex_fix_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
