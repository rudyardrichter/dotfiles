" provide load control
if exists('b:loaded_tex_autoclose')
    finish
endif
let b:loaded_tex_autoclose = 1

if exists('g:tex_autoclose_fregexp')
    if g:tex_autoclose_fregexp != 'none'
        let b:tex_autoclose_fregexp = g:tex_autoclose_fregexp
    endif
else
    let b:tex_autoclose_fregexp =
                \ '\v^(theorem|lemma|corollary|proposition|remark|problem|enumerate|itemize)\*?$'
endif

if !hasmapto("TexACClosePrev()")
    inoremap <buffer> <silent> <C-]>   <c-\><c-o>:call TexACClosePrev()<cr>
endif

function! TexACCloseCurrent()
    let line = getline('.')
    let linestart = strpart( line, 0, col('.'))

    let env = matchstr( linestart, '\v%(\\begin\{)@<=[a-zA-Z0-9*]+$')
    if env != ''
        exec "normal! a\<cr>\\end{" . env . "}\<esc>k"
        startinsert!
    else
        " Not a begin tag. Resume insert mode as if nothing had happened
        if col('.') < strlen(substitute(line, ".", "x", "g"))
            normal! l
            startinsert
        else
            startinsert!
        endif
    endif
endfunction

" Return the name of the innermost OPEN environment at the cursor position.
function! TexACGetEnvName()
    let lnum = 0
    let cnum = 0

    let [lnum, cnum] = searchpairpos( '\v\\begin\{[a-zA-Z]+\*?\}', '',
                \ '\v\\end\{[a-zA-Z]+\*?\}', 'bn' )

    if lnum == 0 && cnum == 0
        return
    endif

    let line = getline( lnum )
    let line = strpart( line, cnum - 1)
    let env  = matchstr( line, '\v^\\begin\{\zs[A-Za-z]+\*?')
    if exists( b:tex_autoclose_fregexp ) && env =~ b:tex_autoclose_fregexp
        let fold = matchstr( line, '\v\%\{{3}[1-9]?' )
    else
        let fold = matchstr( line, '\v^\\begin\{[A-Za-z]+\*?\}.*\zs\%\{{3}[1-9]?$')
    endif

    return [env, fold]
endfunction

function! TexACClosePrev()
    let [env, fold] = TexACGetEnvName()
    let at_eol = ( col('.') == col('$') )

    if env != ''
        let fold = tr( fold, '{', '}' )
        exec 'normal! o\end{' . env . '}' . fold . 'kA'
    endif

    if at_eol
        startinsert!
    else
        normal l
    endif
endfunction
