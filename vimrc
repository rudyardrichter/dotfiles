" ==== Plugins ====

call plug#begin('~/.vim/plugged')
Plug 'skywind3000/asyncrun.vim'
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/syntastic'
if has('python')
    Plug 'SirVer/ultisnips'
endif
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
"Plug 'itchyny/lightline.vim'
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
Plug 'jez/vim-better-sml', {'for': ['sml']}
" close vundle section (don't touch)
call plug#end()


" ==== Plugin Settings ====

" Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""
" same as default, but without the 'X%' part
let g:airline_section_z = '%{g:airline_symbols.linenr}%4l:%=%3.v'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''

" UltiSnips
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=['snippet', '/Users/rudayd/dotfiles/vim/bundle/vim-snippets/UltiSnips']
let g:UltiSnipsSnippetsDir='/Users/rudyard/.vim/snippet'

" SimpylFold
let g:SimpylFoldDocstring=1


" ==== General Configuration ====

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
set undofile                    " maintain persistent undo history
set undodir=~/.vim/undo         " directory for undo history storage
set undolevels=1000             " lots of undo memory
set backupdir=~/.vim/swp        " directory for swap files
set gdefault                    " include /g in sed by default


" ==== Indentation ====

set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4


" ==== Folding ====

fu! CustomFoldText()
    " highest fold level in current file
    let fmax = max(map(range(1, line('$')), 'foldlevel(v:val)'))
    " get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+", v:foldlevel) . repeat("-", fmax-v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let foldInfoLen = 2 + strwidth(foldSizeStr.foldPercentage.foldLevelStr)
    let line = line[0:w-foldInfoLen]
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage) + 2)
    return line . ' ' . expansionString . foldSizeStr . foldPercentage . foldLevelStr . ' '
endf

set foldenable
set foldtext=CustomFoldText()
set fillchars=fold:.


" ==== Preview ====

func! PreviewWord()
  if &previewwindow                     " don't do this in the preview window
    return
  endif
  let w = expand("<cword>")             " get the word under cursor
  if w =~ '\a'                  " if the word contains a letter

    " Delete any existing highlight before showing another tag
    silent! wincmd P                    " jump to preview window
    if &previewwindow                   " if we really get there...
      match none                        " delete existing highlight
      wincmd p                  " back to old window
    endif

    " Try displaying a matching tag for the word under the cursor
    try
       exe "ptag " . w
    catch
      return
    endtry
  endif
endfun


" ==== Mappings/Bindings ====

" life is good
noremap ; :
noremap : `
noremap ` "
noremap " ,
noremap , '
noremap ' ;

nnoremap <CR> :w<CR>
inoremap <C-CR> <C-c>:w<CR>
inoremap <C-J> <C-c>:w<CR>

" these make more sense
noremap H ^
noremap J mjJ`j
noremap K <nop>
noremap L $
noremap Y y$

nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

nnoremap <Tab> za
nnoremap <C-n> :set rnu!<CR>

noremap <F2> :set list!<CR>
inoremap <F2> <C-o>:set list!<CR>

" use arrow keys for split navigation
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j
nnoremap <Left>  <C-w>h
nnoremap <Right> <C-w>l

let mapleader="\<space>"
set notimeout

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

" Save session
nnoremap <leader>s :mksession<CR>

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

" syntax highlighting
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

set t_Co=256

if has("gui_running")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
endif
