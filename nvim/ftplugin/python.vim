set tw=79
set cindent

"let g:python_comment_text_width=72
"function! GetPythonTextWidth()
"    " Adaptively change the textwidth to be 79 in code and 72 in comments and
"    " docstrings, as described in the PEP8 standard.
"    let cur_syntax = synIDattr(synIDtrans(synID(line("."), col("."), 0)), "name")
"    if cur_syntax == "Comment"
"        return g:python_comment_text_width
"    elseif cur_syntax == "String" || cur_syntax == "Constant"
"        " Check to see if we're in a docstring
"        let lnum = line(".")
"        while lnum >= 1 && (synIDattr(synIDtrans(synID(lnum, col([lnum, "$"]) - 1, 0)), "name") == "String" || match(getline(lnum), '\v^\s*$') > -1)
"            if match(getline(lnum), "\\('''\\|\"\"\"\\)") > -1
"                " Assume that any longstring is a docstring
"                return g:python_comment_text_width
"            endif
"            let lnum -= 1
"        endwhile
"    endif
"
"    return &tw
"endfunction
"
"augroup pep8
"    au!
"    autocmd CursorMoved,CursorMovedI * :exe 'setlocal textwidth='.GetPythonTextWidth()
"augroup END
