let g:python_host_prog = '/Users/rudyard/envs/neovim/bin/python2'
let g:python3_host_prog = '/Users/rudyard/envs/neovim/bin/python3'
let g:ycm_python_binary_path = 'python'


" ==== Plugins ====

call plug#begin('~/.config/nvim/plugged')
Plug 'skywind3000/asyncrun.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'autozimu/LanguageClient-neovim', {'tag': 'binary-*-x86_64-apple-darwin'}
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'valloric/youcompleteme'

" rust
Plug 'rust-lang/rust.vim', {'for': ['rust']}
Plug 'racer-rust/vim-racer', {'for': ['rust']}
Plug 'roxma/nvim-cm-racer', {'for': ['rust']}

" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" filetype-specific plugins
Plug 'fatih/vim-go', {'for': ['go']}
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
Plug 'jez/vim-better-sml', {'for': ['sml']}
Plug 'hashivim/vim-terraform', {'for': ['terraform']}
call plug#end()

" Neomake
let g:neomake_error_sign = {'text': '❯❯', 'texthl': 'Error'}
let g:neomake_warning_sign = {'text': '⟩⟩', 'texthl': 'Todo'}
let g:neomake_python_enabled_makers = ['python', 'frosted', 'pyflakes', 'pylint']
let g:neomake_python_pylint_args = [
    \ '--output-format=text',
    \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
    \ '--reports=no',
    \ '2>/dev/null',
    \ ]
autocmd! BufWritePost * Neomake

" ctrlp
let g:ctrlp_cmd = 'CtrlPBuffer'
set grepprg=rg
let g:ctrlp_user_command='rg %s --files --follow --color=never'
let g:ctrlp_use_caching=0
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=50
let gctrlp_working_path_mode=''

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeMapActivateNode = 'o'
let NERDTreeMapChangeRoot = 'c'
let NERDTreeMapOpenSplit = 's'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeIgnore = ['\.pyc$']

" airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.notexists = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.whitespace = ''
let g:airline_section_x = ''
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'
let g:airline_section_z = '%4l:%=%-3.v'

" LanguageClientServer
let g:LanguageClient_autoStart = 0
nnoremap <leader>lcs :LanguageClientStart<CR>
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'] }

" UltiSnips
let g:UltiSnipsExpandTrigger='<nop>'
let g:UltiSnipsListSnippets='<S-CR>'
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=['snippet']
let g:UltiSnipsSnippetsDir='/Users/rudyardrichter/.config/nvim/snippet'
let g:ultisnips_python_style='google'
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

" SimpylFold
let g:SimpylFoldDocstring=1


" ==== General Configuration ====

filetype on
filetype plugin on
filetype indent on
set nocompatible                " use vim settings, not vi
set confirm                     " ask to save instead of failing
set wildmenu                    " diplay completion options
set wildmode=longest:full,full  " set tab completion method
set wildignorecase              " ignore case in completion
set wildignore+=*/.git/*
set wildignore+=*/tmp/*
set wildignore+=*.swp
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


" ==== Display ====

set title                       " display file name in an xterm
set nonumber                    " don't show line numbers
set ruler                       " display cursor position in status
set cursorline                  " highlight the current line
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
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0) - fmax - 1
    let bufnumber = bufn('%')
    let signsPlaced = sign place buffer=bufnumber
    if signsPlaced
        let w -= 2
    endif
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
nnoremap Q :q<CR>

nnoremap n nzz
nnoremap N Nzz

" use arrow keys for split navigation
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j
nnoremap <Left>  <C-w>h
nnoremap <Right> <C-w>l

noremap ; :
noremap : `
noremap - "
noremap ` "
noremap " ,
noremap M '
noremap , '
noremap ' ;

inoremap <C-j> <C-c>:w<CR>

nnoremap <C-h> <C-o>
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>
nnoremap <C-l> <C-i>
nnoremap <C-q> :lw<CR>

vnoremap > >gv
vnoremap < <gv

" This is actually <C-/>.
nnoremap <silent> <C-_> :let @/=""<CR><C-l>

tnoremap <Esc> <C-\><C-n>

nnoremap <CR> :w<CR>
nnoremap <Tab> za
nnoremap <C-n> :set rnu!<CR>
nnoremap <C-f> :CtrlP<CR>
nnoremap <C-s> :CtrlPLine<CR>

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

noremap <F2> :set list!<CR>
inoremap <F2> <C-o>:set list!<CR>

let mapleader="\<space>"
set notimeout

" copy and paste from clipboard
noremap <leader>c "*y
noremap <leader>p "*p
noremap <leader>P "*P

" cd
nnoremap <leader>d :cd %:h<CR>

nnoremap <leader>q gqq

nnoremap <leader>h mh*`h

" Remove Whitespace
nnoremap <leader>rw :%s/\s\+$//<CR> :nohl<CR> :w<CR>

nnoremap <leader>lcs :LanguageClientStart<CR>

" access vimrc more easily
" Vimrc EDit
nnoremap <leader>ved :e $MYVIMRC<CR>:nohl<CR>
" Vimrc SPlit
nnoremap <leader>vsp :split $MYVIMRC<CR>:nohl<CR>
" Vimrc SourCe
nnoremap <leader>vsc :source $MYVIMRC<CR>:nohl<CR>

" Tab navigation
noremap <PageUp> gt
noremap <PageDown> gT
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt


" ==== Session Management ====

fu! SaveSession()
    let here = substitute(expand('%:p:h'), "/", "-", "g")
    let session_filename = $HOME . "/.config/nvim/sessions/" . here
    execute 'mksession! ' . session_filename
endfunction

fu! RestoreSession()
    echom expand('%')
    if expand('%') == ''
        let here = substitute(expand('%:p:h'), "/", "-", "g")
        if here != ''
            let session_filename = $HOME . "/.config/nvim/sessions/" . here
            try
                execute 'source ' . session_filename
                if bufexists(1)
                    for l in range(1, bufnr('$'))
                        if bufwinnr(l) == -1
                            exec 'sbuffer ' . l
                        endif
                    endfor
                endif
            catch
            endtry
        endif
    endif
endfunction

autocmd VimLeave * call SaveSession()
autocmd VimEnter * call RestoreSession()


" ==== GUI Options ====

set t_Co=256
colorscheme solarized
if $BG == "light"
    set bg=light
else
    set bg=dark
endif
if $ITERM_PROFILE == 'gruvbox'
    colorscheme gruvbox
endif
hi Todo cterm=None ctermfg=5

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

if has("gui_running")
    set guifont=Source\ Code\ Pro:h12
endif
