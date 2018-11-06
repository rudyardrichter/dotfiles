func! PreviewWord()
    if &previewwindow                     " don't do this in the preview window
        return
    endif
    let w = expand("<cword>")             " get the word under cursor
    if w =~ '\a'                  " if the word contains a letter
        " Try displaying a matching tag for the word under the cursor
        try
            exe "ptag " . w
        catch
            return
        endtry

        silent! wincmd P                    " jump to preview window
        if &previewwindow                   " if we really get there...
            match none                        " delete existing highlight
            exe "normal! zO<CR>"
            exe "normal! zt<CR>"
            wincmd p                          " back to old window
        endif
    endif
endfunc

func! EnablePreview()
    au! CursorHold * nested call PreviewWord()
endfunc
