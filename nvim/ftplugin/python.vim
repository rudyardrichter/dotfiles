set tw=79
set cindent

let g:pylint = $VIRTUAL_ENV
if g:pylint == ''
    let g:neomake_python_enabled_makers=['python']
else
    let g:pylint_arg = g:pylint . '/bin/pylint'
    let g:neomake_python_vpylint_maker = {
        \ 'exe': 'python',
        \ 'args': [
        \     g:pylint_arg,
        \     '--output-format=text',
        \     '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
        \     '--reports=no'
        \ ],
        \ 'auto_enabled': 1,
        \ 'errorformat': '%A%f:%l:%c:%t: %m,%A%f:%l: %m,%A%f:(%l): %m,%-Z%p^%.%#,%-G%.%#',
        \ 'output_stream': 'stdout',
        \ 'postprocess': [function('neomake#postprocess#GenericLengthPostprocess'), function('neomake#makers#ft#python#PylintEntryProcess')],
        \ }
    let g:neomake_python_enabled_makers=['python', 'vpylint']
endif
