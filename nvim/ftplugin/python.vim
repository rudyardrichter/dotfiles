set tw=88
set cindent
set tags=./.tags;/

"let g:neomake_python_pylint_maker = {
"    \ 'append_file': 1,
"    \ 'args': ['--output-format=text', '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"', '--reports=no'],
"    \ 'auto_enabled': 1,
"    \ 'errorformat': '%A%f:%l:%c:%t: %m,%A%f:%l: %m,%A%f:(%l): %m,%-Z%p^%.%#,%-G%.%#',
"    \ 'exe': 'pylint',
"    \ 'output_stream': 'stdout',
"    \ 'postprocess': [function('neomake#postprocess#GenericLengthPostprocess'), function('neomake#makers#ft#python#PylintEntryProcess')],
"    \ }

let g:neomake_python_enabled_makers = ["python", "frosted", "pyflakes", "pylint"]

let g:pyindent_open_paren='&sw'
let g:pyindent_continue='&sw'
