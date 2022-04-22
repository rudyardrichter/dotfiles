call neomake#configure#automake('w')

let g:neomake_python_enabled_makers = ['python', 'pyflakes']

let g:neomake_warning_sign = {'text': '✖', 'texthl': 'NeomakeWarningMsg'}

" This will tack on these highlights to any existing color scheme, AS LONG AS
" the colorscheme is sourced AFTER these lines.
augroup NeomakeColors
    autocmd!
    autocmd ColorScheme * highlight NeomakeVirtualtextError ctermfg=167
                      \ | highlight NeomakeVirtualtextWarning ctermfg=214
                      \ | highlight NeomakeWarningSign ctermfg=214
augroup END

call neomake#configure#automake('w')
