let g:python2_host_prog = "/usr/local/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"


" ==== Plugins ====

call plug#begin('~/.config/nvim/plugged')
Plug 'skywind3000/asyncrun.vim'
Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
if has("python")
    Plug 'SirVer/ultisnips'
endif
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
" filetype-specific plugins
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
Plug 'jez/vim-better-sml', {'for': ['sml']}
Plug 'hashivim/vim-terraform', {'for': ['terraform']}
call plug#end()


" ==== Plugin Settings ====

" neomake
autocmd! BufWritePost * Neomake
augroup neomake_signs
autocmd ColorScheme *
    \ hi NeomakeErrorSign ctermfg=1 |
    \ hi NeomakeWarningSign ctermfg=9

" ctrlp
let g:ctrlp_cmd = 'CtrlPBuffer'

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"" lightline
"colorscheme solarized
"let g:lightline = {
"    \   'colorscheme': 'solarized',
"    \   'active': {
"    \     'left': [
"    \       ['mode', 'paste'],
"    \       ['readonly'],
"    \       ['filename', 'modified']
"    \     ],
"    \     'right': [
"    \       ['lineinfo', 'percent'],
"    \       ['fileencoding', 'fileformat'],
"    \       ['filetype'],
"    \     ],
"    \   }
"    \ }

" airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ""
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = ''
" same as default, but without the 'X%' part
let g:airline_section_warning =
    \ "%{airline#util#wrap(airline#extensions#neomake#get_warnings(),0)}"
    \ . "%{empty(airline#extensions#neomake#get_warnings())"
    \ . "|| empty(airline#extensions#whitespace#check()) ? '' : ' '}"
    \ . "%{airline#util#wrap(airline#extensions#whitespace#check(),0)}"
let g:airline_section_z = '%{g:airline_symbols.linenr}%4l:%=%3.v'

" UltiSnips
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=['snippet']
let g:UltiSnipsSnippetsDir='/Users/rudyardrichter/.config/nvim/snippet'
let g:ultisnips_python_style="sphinx"

" SimpylFold
let g:SimpylFoldDocstring=1


" ==== General Configuration ====

filetype on
filetype plugin on
filetype indent on
set nocompatible                " use vim settings, not vi
set confirm                     " ask to save instead of failing
set wildmenu                    " diplay completion options
set wildignorecase              " ignore case in completion
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


" ==== Display ====

set title                       " display file name in an xterm
set number                      " show line numbers
set ruler                       " display cursor position in status
set cursorline                  " highliht the current line
set encoding=utf-8              " set text to utf-8 standard
set laststatus=2                " status line
set guioptions-=r
set guioptions-=L


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
    let foldPercentage = printf("(%.1f", (foldSize*1.0)/lineCount*100) . "%) "
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

noremap H ^
noremap J mjJ`j
noremap K <nop>
noremap L $
noremap Y y$

nnoremap n nzz
nnoremap N Nzz

noremap ; :
noremap : `
noremap ` "
noremap " ,
noremap , '
noremap ' ;

nnoremap <CR> :w<CR>
inoremap <C-CR> <C-c>:w<CR>
inoremap <C-j> <C-c>:w<CR>

tnoremap <Esc> <C-\><C-n>

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
nnoremap <leader>cd :cd %:h<CR>

nnoremap <leader>q gqq

" Highlight
let g:HL_ON=0
func! ToggleHL()
    if g:HL_ON == 1
        let @/=""
    else
        normal! mh#`h
    endif
    let g:HL_ON=abs(1-g:HL_ON)
endfun
"nnoremap <leader>h :if (g:HL_ON == 1) \| let @/="" \| else \| normal! mh#`h \| endif \| let g:HL_ON=abs(1-g:HL_ON)
nnoremap <leader>h mh#`h
nnoremap <silent> <C-l> :let @/=""<CR><C-l>

" Remove Whitespace
nnoremap <leader>rw :%s/\s\+$//<CR> :nohl<CR> :w<CR>

" access vimrc more easily
" Vimrc EDit
nnoremap <leader>ved :e $MYVIMRC<CR>:nohl<CR>
" Vimrc SPlit
nnoremap <leader>vsp :split $MYVIMRC<CR>:nohl<CR>
" Vimrc SourCe
nnoremap <leader>vsc :source $MYVIMRC<CR>:nohl<CR>

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt


" ==== GUI Options ====

set t_Co=256
if $BG == "light"
    set bg=light
else
    set bg=dark
endif
colorscheme solarized

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

if has("gui_running")
    set guifont=Source\ Code\ Pro:h12
endif
