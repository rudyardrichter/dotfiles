set t_Co=256
colorscheme gruvbox
set bg=dark

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

highlight Todo ctermbg=None ctermfg=1
" this fixes a weird bug on punctuation highlighting that I was having
highlight Normal ctermfg=223 guifg=#ebdbb2 ctermbg=NONE guibg=NONE

if has("gui_running")
    set guifont=Source\ Code\ Pro:h12
endif
