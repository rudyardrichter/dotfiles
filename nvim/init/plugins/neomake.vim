let g:neomake_python_enabled_makers = ['python', 'pyflakes']
" let language server handle everything
let g:neomake_typescript_enabled_makers = []

let g:neomake_warning_sign = {'text': '✖', 'texthl': 'NeomakeWarningMsg'}
let g:neomake_python_python_args = ['/home/rudyard/.config/nvim/plugged/neomake/autoload/neomake/makers/ft/python/compile.py', '%']

" This will tack on these highlights to any existing color scheme, AS LONG AS
" the colorscheme is sourced AFTER these lines.
augroup NeomakeColors
    autocmd!
    autocmd ColorScheme * highlight NeomakeVirtualtextError ctermfg=167
                      \ | highlight NeomakeVirtualtextWarning ctermfg=214
                      \ | highlight NeomakeWarningSign ctermfg=214
augroup END

call neomake#configure#automake('w')
