let g:python_host_prog="/usr/bin/python"
let g:python3_host_prog="/home/rudyard/.envs/neovim3.6/bin/python"

let g:init = '~/.config/nvim/init/'

let g:config_files = [
    \ 'plugins.vim',
    \ 'defaults.vim',
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

try
    colorscheme $COLORSCHEME
catch /.*/
    colorscheme solarized
endtry
