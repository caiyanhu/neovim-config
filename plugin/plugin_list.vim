" 代码补全插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" 主题theme类插件
Plug 'rakr/vim-one'

" 顶栏和底栏
Plug 'itchyny/lightline.vim'

" 彩虹括号
Plug 'luochen1990/rainbow'

" 函数列表
Plug 'liuchengxu/vista.vim', {'on': ['Vista!!', 'Vista']}

" 快速包围
Plug 'tpope/vim-surround'

" 代码段
Plug 'honza/vim-snippets'

" 平滑滚动
Plug 'psliwka/vim-smoothie'

" jk加速
Plug 'rhysd/accelerated-jk'

" 显示颜色
Plug 'norcalli/nvim-colorizer.lua'

" the fancy start screen for vim
Plug 'mhinz/vim-startify'

" coc插件列表
let g:coc_global_extensions = [
    \ 'coc-yaml',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ ]

"defx
if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    " add  file icons to defx
    Plug 'kristijanhusak/defx-icons'
endif

" finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" front end development
Plug 'mattn/emmet-vim'
Plug 'andrewradev/tagalong.vim'
Plug 'leafoftree/vim-vue-plugin'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" auto pairs
Plug 'krasjet/auto.pairs'

" git
Plug 'zivyangll/git-blame.vim'
Plug 'itchyny/vim-gitbranch'
