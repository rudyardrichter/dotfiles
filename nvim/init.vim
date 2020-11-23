let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/home/rudyard/.envs/neovim3.6/bin/python"

let g:init = '~/.config/nvim/init/'

" notes on ordering:
" - `filetype plugin` commands in `defaults` must happen before `plugins`
let g:config_files = [
    \ 'defaults.vim',
    \ 'plugins.vim',
    \ 'indentation.vim',
    \ 'folding.vim',
    \ 'preview.vim',
    \ 'search.vim',
    \ 'mappings.vim',
    \ 'gui.vim',
    \ ]

for file in g:config_files
    exe 'source ' . g:init . file
endfor
