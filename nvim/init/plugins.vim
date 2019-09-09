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
Plug 'SirVer/ultisnips'
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
Plug 'plasticboy/vim-markdown', {'for': ['markdown']}
Plug 'fatih/vim-go', {'for': ['go']}
Plug 'mdempsky/gocode', {'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh'}
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
Plug 'ambv/black', {'for': ['python']}
Plug 'rust-lang/rust.vim', {'for': ['rust']}
Plug 'racer-rust/vim-racer', {'for': ['rust']}
Plug 'roxma/nvim-cm-racer', {'for': ['rust']}
Plug 'jez/vim-better-sml', {'for': ['sml']}
Plug 'hashivim/vim-terraform', {'for': ['terraform']}
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
call plug#end()

" black (python autoformatter)
let g:black_virtualenv = '/home/rudyard/.envs/neovim3.6'
"autocmd BufWritePre *.py execute ':Black'

" gitgutter
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>
nnoremap <leader>gs :GitGutterStageHunk<CR>
let g:gitgutter_enabled = 0
nnoremap <leader>gl :Gbrowse<CR>
vnoremap <leader>gl :Gbrowse<CR>

" language server client
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
let g:LanguageClient_autoStart = 1
" don't use virtual text to show errors inline
let g:LanguageClient_useVirtualText = 0

" completion settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" disable language client completion, we already get these from jedi
call ncm2#override_source('LanguageClient_python', {'enable': 0})

" Neomake
"let g:neomake_error_sign = {'text': '❯❯', 'texthl': 'Error'}
"let g:neomake_warning_sign = {'text': '⟩⟩', 'texthl': 'Todo'}
"autocmd! BufWritePost * Neomake

" ctrlp
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_user_command='rg %s --files --no-ignore --hidden --follow --color=never'
let g:ctrlp_max_files=10000
let g:ctrlp_max_depth=50
let gctrlp_working_path_mode='rc'

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
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ale#enabled = 0
let g:airline_skip_empty_sections = 1

"
let g:tagbar_map_togglefold = "<tab>"

let g:enable_powerline_symbols = 0
if g:enable_powerline_symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
else
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = '|'
endif
let g:airline_symbols.branch = ''
let g:airline#extensions#branch#empty_message = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = ''
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_x = ''
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'
let g:airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%4l:%-3.v / %#__accent_bold#%L%#__restore__#'
"let g:airline_section_z = '%4l:%=%-3.v'

" UltiSnips
let g:UltiSnipsExpandTrigger='<C-S-e>'
let g:UltiSnipsListSnippets='<S-CR>'
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=['snippet']
let g:UltiSnipsSnippetsDir='~/.config/nvim/snippet'
let g:ultisnips_python_style='google'
let g:ulti_expand_or_jump_res = 0

" markdown
let g:vim_markdown_folding_disabled = 1
