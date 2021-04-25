let g:clap_theme  = 'material_design_dark'
" clap布局相对于整个编辑器而不是窗口
let g:clap_layout = {'relative': 'editor'}

noremap <leader><s-f> :Clap grep ++query=<cword><CR>
noremap <leader>ff :Clap files<CR>
