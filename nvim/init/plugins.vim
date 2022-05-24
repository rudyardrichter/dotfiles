call plug#begin('~/.config/nvim/plugged')
Plug 'skywind3000/asyncrun.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'
"Plug 'airblade/vim-gitgutter'
"Plug 'ludovicchabant/vim-gutentags'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug '~/.fzf'
Plug '~/.config/nvim/plugged/fzf'
Plug 'junegunn/fzf.vim'
" filetype-specific plugins
Plug 'fatih/vim-go', {'for': ['go']}
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
"Plug 'davidhalter/jedi-vim', {'for': ['python']}
Plug 'ambv/black', {'for': ['python']}
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}
Plug 'rust-lang/rust.vim', {'for': ['rust']}
Plug 'racer-rust/vim-racer', {'for': ['rust']}
Plug 'neoclide/coc-rls', {'for': ['rust']}
Plug 'jez/vim-better-sml', {'for': ['sml']}
Plug 'hashivim/vim-terraform', {'for': ['terraform']}
"Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
call plug#end()

let g:plugin_configs = [
    \ 'airline',
    \ 'coc',
    \ 'gitgutter',
    \ 'markdown',
    \ 'neomake',
    \ 'nerdtree',
    \ 'ultisnips',
    \ ]

for file in g:plugin_configs
    exe 'source ' . g:init . 'plugins/' . file . '.vim'
endfor

" TODO: move this
let g:jedi#show_call_signatures = "2"
