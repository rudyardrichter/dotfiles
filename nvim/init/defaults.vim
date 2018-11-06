filetype on
filetype plugin on
filetype indent on
set nocompatible                " use vim settings, not vi
set confirm                     " ask to save instead of failing
set wildmenu                    " diplay completion options
set wildmode=longest:full,full  " set tab completion method
set wildignorecase              " ignore case in completion
set backspace=indent,eol,start  " allow backspace on everything
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
set undofile                    " maintain persistent undo history
set undodir=~/.vim/undo         " directory for undo history storage
set undolevels=1000             " lots of undo memory
set updatetime=250              " ms after which cursor is considered idle
set backupdir=~/.vim/swp        " directory for swap files
set gdefault                    " include /g in sed by default
set shortmess+=c                " suppress completion messages
set tags=./.tags;./..           " where to look for tags file
set showbreak=…                 " display wrapped lines
set title                       " display file name in an xterm
set nonumber                    " don't show line numbers
set ruler                       " display cursor position in status
set cursorline                  " highlight the current line
set encoding=utf-8              " set text to utf-8 standard
set laststatus=2                " status line
set guioptions-=r
set guioptions-=L
set wildignore+=*/.git/*
set wildignore+=*/tmp/*
set wildignore+=*.egg-info/*
set wildignore+=*.swp
