let g:vim_root_path = fnamemodify($MYVIMRC, ':h') . '/'
let g:config_root_path = g:vim_root_path . 'config/'
let g:plugins_config_root_path = g:config_root_path . 'plugins/'
let g:global_config_root_path = g:config_root_path . 'global/'
let g:theme_root_path = g:vim_root_path . 'theme/'
let g:plugins_install_root_path = $HOME . '/.cache/nvim/plugins'
let g:plugin_list_root_path = g:vim_root_path . 'plugin/'

command! -nargs=1 LoadGlobalConfigScript exec 'source ' . g:global_config_root_path . '<args>'
command! -nargs=1 LoadPluginListScript exec 'source ' . g:plugin_list_root_path . '<args>'

LoadGlobalConfigScript base.vim
LoadGlobalConfigScript keymap.vim

call plug#begin(get(g:,'plugins_install_root_path'))
LoadPluginListScript plugin_list.vim
call plug#end()

command! -nargs=1 LoadThemeScript exec 'source ' . g:theme_root_path . '<args>'
LoadThemeScript theme_config.vim

" 依据插件名称载入对应的插件配置
function s:source_config(plugName) abort
    let l:config_path = g:plugins_config_root_path . a:plugName . ".vim"
    if filereadable(l:config_path)
        exec 'source' fnameescape(l:config_path)
    endif
endfunction

for [plugName,_] in items(g:plugs)
    if common#functions#HasInstall(plugName)
        call s:source_config(plugName)
    endif
endfor
