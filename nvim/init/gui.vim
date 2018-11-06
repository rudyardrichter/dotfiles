set t_Co=256
colorscheme solarized
if $BG == "light"
    set bg=light
else
    set bg=dark
endif
if $BG == 'gruvbox'
    colorscheme gruvbox
endif
hi Todo cterm=None ctermfg=5

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

if has("gui_running")
    set guifont=Source\ Code\ Pro:h12
endif
