" General Configuration
filetype on
filetype plugin on
filetype indent on
set nocompatible                " use vim settings, not vi
set confirm                     " ask to save instead of failing
set wildmenu                    " diplay completion options
set backspace=indent,eol,start  " allow backspace on everyting
set history=1000                " store cmd history
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
set shiftround                  " round indentation to shiftwidth
set lcs=tab:▸\ ,trail:·,nbsp:_  " invisible characters to display
set undolevels=1000             " lots of undo memory
set gdefault                    " include /g in sed by default

" Indentation
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4

" Display
set title                       " display file name in an xterm
set ruler                       " display cursor position in status
set cursorline                  " highliht the current line
set encoding=utf-8              " set text to utf-8 standard
set laststatus=2                " status line
set guioptions-=r
set guioptions-=L

" Mappings/Bindings

noremap H ^
noremap J mjJ`j
noremap K <nop>
noremap L $
noremap Y y$
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>
nnoremap <C-n> :set rnu!<CR>
noremap <F2> :set list!<CR>
inoremap <F2> <C-o>:set list!<CR>
" use arrow keys for split navigation
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j
nnoremap <Left>  <C-w>h
nnoremap <Right> <C-w>l

" Colorscheme
set t_Co=256
set bg=dark
colorscheme solarized
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif
