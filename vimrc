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
Plugin 'bling/vim-airline'        " statusline
Plugin 'vim-airline/vim-airline-themes'

" close vundle section (don't touch)
call vundle#end()
filetype plugin indent on


" ==== Plugin Settings ====

"source /Users/rudyard/.vim/lightline.vim

" Airline
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
" same as default, but without the 'X%' part
let g:airline_section_z = '%{g:airline_symbols.linenr}%4l:%=%3.v'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


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
set noerrorbells                " no beeping
set novisualbell                " no flashing
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

" syntax highlighting
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

set t_Co=256

if has("gui_running")
    set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
else
    set term=xterm-256color
    " airline settings for terminal: no separators; no "LN" character
    "let g:airline_left_sep=''
    "let g:airline_left_alt_sep='|'
    "let g:airline_right_sep=''
    "let g:airline_right_alt_sep='|'
    let g:airline_section_z = '%4l:%=%3.v'
endif
