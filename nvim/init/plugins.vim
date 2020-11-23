call plug#begin('~/.config/nvim/plugged')
Plug 'skywind3000/asyncrun.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Completion
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-racer'
Plug 'roxma/nvim-yarp'
" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" filetype-specific plugins
Plug 'fatih/vim-go', {'for': ['go']}
Plug 'mdempsky/gocode', {'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh'}
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
Plug 'davidhalter/jedi-vim', {'for': ['python']}
Plug 'ambv/black', {'for': ['python']}
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}
Plug 'rust-lang/rust.vim', {'for': ['rust']}
Plug 'racer-rust/vim-racer', {'for': ['rust']}
Plug 'roxma/nvim-cm-racer', {'for': ['rust']}
Plug 'jez/vim-better-sml', {'for': ['sml']}
Plug 'hashivim/vim-terraform', {'for': ['terraform']}
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
call plug#end()

let g:plugin_configs = [
    \ 'airline',
    \ 'ctrlp',
    \ 'gitgutter',
    \ 'markdown',
    \ 'neomake',
    \ 'ncm2',
    \ 'nerdtree',
    \ 'ultisnips',
    \ ]

for file in g:plugin_configs
    exe 'source ' . g:init . 'plugins/' . file . '.vim'
endfor

" TODO: move this
let g:jedi#show_call_signatures = "2"
