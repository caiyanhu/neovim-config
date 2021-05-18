
call coc#add_extension('coc-style-helper','coc-react-refactor')

call coc#add_extension('coc-vetur')

" Auto generate the comment for function or method
nnoremap gcg :GoAuToComment<CR>

call coc#config('languageserver', {
\ 'golang': {
	\ "command": "gopls",
	\ "rootPatterns": ["go.mod"],
	\ "disableWorkspaceFolders": "true",
	\ "filetypes": ["go"]
	\ }
	\})

let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

call coc#add_extension('coc-html')

call coc#add_extension('coc-css')
