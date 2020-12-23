autocmd! BufWritePost * Neomake

let g:neomake_python_enabled_makers = ['python', 'pyflakes']

let g:neomake_warning_sign = {'text': '✖', 'texthl': 'NeomakeWarningSign'}

let NVIM_VENV = '/home/rudyard/.envs/nvim3.8'
let NEOMAKE_PYTHON = NVIM_VENV . '/bin/python'
let NEOMAKE_PYLINT = NVIM_VENV . '/bin/pylint'
let NEOMAKE_PYFLAKES = NVIM_VENV . '/bin/pyflakes'

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
    \ 'exe': NEOMAKE_PYLINT,
    \ 'args': [
        \ "--init-hook=\"import pylint_venv; pylint_venv.inithook('$(pwd)/.venv', force_venv_activation=True)\"",
        \ '--output-format=text',
        \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
        \ '--reports=no'
        \ ],
    \ 'auto_enabled': 0,
    \ 'errorformat': '%A%f:%l:%c:%t: %m,%A%f:%l: %m,%A%f:(%l): %m,%-Z%p^%.%#,%-G%.%#',
    \ 'output_stream': 'stdout',
    \ 'postprocess': [function('neomake#postprocess#generic_length'), function('neomake#makers#ft#python#PylintEntryProcess')],
    \ }

let g:neomake_python_pyflakes_maker = {
    \ 'exe': NEOMAKE_PYFLAKES,
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
