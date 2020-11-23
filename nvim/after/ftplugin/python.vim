syntax region pythonDocstring start=/^\s*"""/ end=/"""/ keepend
highlight link pythonDocstring Comment
syntax keyword XXX id

set tw=88
"set cindent
set tags=./.tags;/

"let g:pyindent_open_paren='&sw'
"let g:pyindent_continue='&sw'

"if filereadable("./pyproject.toml")
"    let g:python3_host_prog = './' . g:venv . '/bin/python'
"endif
