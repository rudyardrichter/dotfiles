set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m

command! -nargs=+ Search silent! grep! <args> <bar> copen <bar> redraw!

nnoremap - :silent! Search<Space>
