fu! CustomFoldText()
    " highest fold level in current file
    let fmax = max(map(range(1, line('$')), 'foldlevel(v:val)'))
    " get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0) - fmax - 1
    let bufnumber = bufn('%')
    let signsPlaced = sign place buffer=bufnumber
    if signsPlaced
        let w -= 2
    endif
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+", v:foldlevel) . repeat("-", fmax-v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("(%.1f", (foldSize*1.0)/lineCount*100) . "%) "
    let foldInfoLen = 2 + strwidth(foldSizeStr.foldPercentage.foldLevelStr)
    let line = line[0:w-foldInfoLen]
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage) + 2)
    return line . ' ' . expansionString . foldSizeStr . foldPercentage . foldLevelStr . ' '
endf

set foldenable
set foldtext=CustomFoldText()
set fillchars=fold:.
