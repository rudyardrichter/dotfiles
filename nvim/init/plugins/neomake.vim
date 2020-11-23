autocmd! BufWritePost * Neomake

let g:neomake_python_enabled_makers = ['python', 'flake8']  " trying no pyflakes

let g:neomake_warning_sign = {'text': '✖', 'texthl': 'NeomakeWarningSign'}

let NEOMAKE_PYTHON = 'python'
let NEOMAKE_PYLINT = 'pylint'
let NEOMAKE_PYFLAKES = 'pyflakes'

let g:neomake_python_python_maker = {
    \ 'exe': NEOMAKE_PYTHON,
    \ 'args': ['/home/rudyard/.config/nvim/plugged/neomake/autoload/neomake/makers/ft/python/compile.py'],
    \ 'auto_enabled': 0,
    \ 'errorformat': '%E%f:%l:%c: %m',
    \ 'output_stream': 'stdout',
    \ 'serialize': 1,
    \ 'serialize_abort_on_error': 1,
    \ 'short_name': 'py',
    \ }

let g:neomake_python_pylint_maker = {
    \ 'exe': 'pylint',
    \ 'args': ['--output-format=text', '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"', '--reports=no'],
    \ 'auto_enabled': 0,
    \ 'errorformat': '%A%f:%l:%c:%t: %m,%A%f:%l: %m,%A%f:(%l): %m,%-Z%p^%.%#,%-G%.%#',
    \ 'output_stream': 'stdout',
    \ 'postprocess': [function('neomake#postprocess#generic_length'), function('neomake#makers#ft#python#PylintEntryProcess')],
    \ }

let g:neomake_python_pyflakes_maker = {
    \ 'exe': 'pyflakes',
    \ 'args': [],
    \ 'auto_enabled': 0,
    \ 'errorformat': '%E%f:%l: could not compile,%-Z%p^,%E%f:%l:%c: %m,%E%f:%l: %m,%-G%.%#',
    \ }

"if filereadable('./.pyenvinfo')
"    let g:venv = system("poetry env info 2>/dev/null | grep Path | tr -d ' ' | cut -d ':' -f 2 | tr -d '\n'")
"    let g:neomake_python_python_maker.exe = g:venv . '/bin/python'
"    let g:neomake_python_pylint_maker.exe = g:venv . '/bin/pylint'
"    let g:neomake_python_pyflakes_maker.exe = g:venv . '/bin/pyflakes'
"endif

" This will tack on these highlights to any existing color scheme, AS LONG AS
" the colorscheme is sourced AFTER these lines.
augroup NeomakeColors
    autocmd!
    autocmd ColorScheme * highlight NeomakeVirtualtextError ctermfg=167
                      \ | highlight NeomakeVirtualtextWarning ctermfg=214
                      \ | highlight NeomakeWarningSign ctermfg=214
augroup END
