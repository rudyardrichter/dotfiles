" Rudyard Richter's vimrc

" use vim settings, not vi
set nocompatible


" ==== Vundle ====

" necessary for vundle (don't touch)
"""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"""
" my plugins:
Plugin 'scrooloose/syntastic'     " syntax checker
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'   " colorscheme package
Plugin 'morhetz/gruvbox'          " gruvbox colorscheme
"Plugin 'tpope/vim-fugitive'       " git wrapper
Plugin 'kien/ctrlp.vim'           " fast file finder
"Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-airline'        " statusline
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Yggdroot/indentLine'      " indent line
"Plugin 'kchmck/vim-coffee-script' " coffeescript
"Plugin 'keith/swift.vim'          " swift
"Plugin 'Valloric/YouCompleteMe'   " autocompletion (large)
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" close vundle section (don't touch)
call vundle#end()
filetype plugin indent on


" ==== Plugin Settings ====

"source /Users/rudyard/.vim/lightline.vim

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_regexp = 1

" Airline
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
" same as default, but without the 'X%' part
let g:airline_section_z = '%{g:airline_symbols.linenr}%4l:%=%3.v'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:syntastic_html_tidy_ignore_errors = [
    \ 'plain text isn''t allowed in <head> elements',
    \ '<base> escaping malformed URI reference',
    \ 'discarding unexpected <body>',
    \ '<script> escaping malformed URI reference',
    \ '</head> isn''t allowed in <body> elements',
    \ 'missing <li>',
    \ 'trimming empty <span>'
    \ ]

let g:syntastic_quiet_messages = {
    \ "!level":  "errors",
    \ "type":    "style",
    \ "regex":   ['dash', 'whitespace'],
    \ "file:p":  ['.tex'] }

"" indentLine
"let g:indentLine_enabled = 0
"let g:indentLine_char = '│'

" UltiSnips
let g:UltiSnipsSnippetDirectories=["/Users/rudyard/.vim/UltiSnips","/Users/rudyard/.vim/bundle/vim-snippets/UltiSnips"]


" ==== General Configuration ====

filetype on
filetype plugin on
filetype indent on
set confirm                     " ask to save instead of failing
set wildmenu                    " diplay completion options
set backspace=indent,eol,start  " allow backspace on everyting
set history=1000                " store cmd history
set undolevels=1000             " lots of undo memory
set showcmd                     " show incomplete commands
set gcr=a:blinkon0              " no cursor blink
set visualbell                  " visual error instead;
set noerrorbells                " no beeping
set mouse=a                     " enable mouse
set cmdheight=1                 " always have cmd bar
set autoread                    " read external changes
set ignorecase                  " ignore case in search...
set smartcase                   " ...unless it has capitals
set incsearch                   " highlight results while typing...
set hlsearch                    " ...and highlight search results
set wrap                        " wrap text
set splitbelow                  " more natural than default
set splitright                  " ^
set lazyredraw                  " what it says
"set scrolloff=3                 " scroll 3 lines at end of screen


" ==== Folding ====

"set foldenable
"set foldlevelstart=0            " don't open any folds at first
"set foldnestmax=0


" ==== Indentation ====

" pretty straightforward
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4


" ==== Mappings/Bindings ====

"function! Close()
"    let char = getline(".")[col(".")-1]
"    if char == '('

" life is good
nnoremap ; :
nnoremap : ;
nnoremap <CR> :w<CR>
inoremap <C-J> <C-c>
inoremap <C-CR> <C-c>:w<CR>
inoremap <C-W> <C-c>:w<CR>

" these make more sense
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
onoremap H ^
onoremap L $

" use arrow keys for split navigation
nnoremap  <Up>    <C-w>k
nnoremap  <Down>  <C-w>j
nnoremap  <Left>  <C-w>h
nnoremap  <Right> <C-w>l

" LEADER MAPPINGS:
""""""""""""""""""""
let mapleader="\<space>"
set notimeout
" a = unbound
" b = unbound
" c = ?
" d = :cd %:h<CR>
" e = unbound
" f = unbound
" g = unbound
" h = mh#`h
" i = A
" j = unbound
" k = unbound
" l = unbound
" m > .tex
" n >
"     h = :nohl<CR>
" o = unbound
" p = unbound
" q = gqq
" r = :%s/\s\+$//<CR> :nohl<CR> :w<CR>
" s = unbound
" t = unbound
" u > LaTeX-Skim...
" v > vimrc-related
"     ed = :e $MYVIMRC<CR>:nohl<CR>
"     sp = :split $MYVIMRC<CR>:nohl<CR>
"     sc = :source $MYVIMRC<CR>:nohl<CR>
" w = unbound
" x = unbound
" y = unbound
" z = unbound

" cd
nnoremap <leader>d :cd %:h<CR>
" like i...but A
nnoremap <leader>i A
nnoremap <leader>q gqq

" Highlight
nnoremap <leader>h mh#`h
" No Highlight
nnoremap <leader>nh :nohl<CR>

" Remove Whitespace
nnoremap <leader>rw :%s/\s\+$//<CR> :nohl<CR> :w<CR>

" access vimrc more easily
" Vimrc EDit
nnoremap <leader>ved :e $MYVIMRC<CR>:nohl<CR>
" Vimrc SPlit
nnoremap <leader>vsp :split $MYVIMRC<CR>:nohl<CR>
" Vimrc SourCe
nnoremap <leader>vsc :source $MYVIMRC<CR>:nohl<CR>


" ==== Display ====

set title                       " display file name in an xterm
set number                      " show line numbers
set ruler                       " display cursor position in status
set cursorline                  " highliht the current line
set encoding=utf-8              " set text to utf-8 standard
set lines=50 columns=90         " set window size
set laststatus=2                " status line
set guioptions-=r
set guioptions-=L

" ==== GUI Options ====

set bg=dark
colorscheme solarized

" switch between dark and light backgrounds (when available)
call togglebg#map("<F1>")
"nnoremap <F1> :call SwitchBG()<CR>
"inoremap <F1> <C-o>:call SwitchBG()<CR>

"function! SwitchBG()
"    if &bg == "dark"
"        set bg=light
"        let g:lightline.colorscheme = 'solarized_light'
"        call UpdateLightline()
"    else
"        set bg=dark
"        let g:lightline.colorscheme = 'solarized_dark'
"        call UpdateLightline()
"    endif
"endfunction
"
"function! UpdateLightline()
"    call lightline#init()
"    call lightline#colorscheme()
"    call lightline#update()
"endfunction

"function! Solarize()
"    set bg=dark
"    "set t_Co=16
"    "let g:solarized_termcolors=16
"    colorscheme solarized
"endfunction

" syntax highlighting
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

set t_Co=256

if has("gui_running")
    "set guifont=Anonymous\ Pro\ for\ Powerline:h13
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
    "set guifont=Inconsolata\ for\ Powerline:h13
    "set guifont=Fira\ Mono\ for\ Powerline:h12
    "set guifont=Inconsolata-dz:h11
    "set guifont=Liberation\ Mono\ for\ Powerline:h12
    set guifont=Meslo\ LG\ M\ for\ Powerline:h12
    "set guifont=Roboto\ Mono\ Light\ for\ Powerline:h12
    "set guifont=Sauce\ Code\ Powerline\ Light:h12
else
    set term=xterm-256color
    " airline settings for terminal: no separators; no "LN" character
    "let g:airline_left_sep=''
    "let g:airline_left_alt_sep='|'
    "let g:airline_right_sep=''
    "let g:airline_right_alt_sep='|'
    let g:airline_section_z = '%4l:%=%3.v'
endif


" ==== Filetype ====

autocmd BufNewFile *.tex set filetype=tex
