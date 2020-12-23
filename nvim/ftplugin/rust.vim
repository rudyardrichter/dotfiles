colorscheme gruvbox

set hidden
let g:racer_cmd = "/home/rudyard/.cargo/bin/racer"

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> <leader>d         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> <leader>s         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> <leader>x         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> <leader>t         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd        <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD        <Plug>(rust-doc-tab)
augroup END
