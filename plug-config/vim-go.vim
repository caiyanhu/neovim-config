let g:go_test_timeout='10s'

" format automatically when save file
let g:go_fmt_autosave = 1
" automatically import when save file
let g:go_fmt_command  = "goimports"
" when format parse errors, it'll show a quickfix lis
let g:go_fmt_fail_silently  = 0

" GpAlternate快捷键，在文件和测试文件之间切换
autocmd FileType  go  command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType  go  command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType  go  command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType  go  command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" highlight all same selections
let g:go_auto_sameids = 1
