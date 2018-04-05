set linebreak
set breakindent
let g:tex_flavor='latex'
set bg=light
colo lucius
let g:airline_theme='lucius'
AirlineRefresh

nnoremap <leader>f :call MakeTexFolds(1)<CR>

"set cole=2
"let g:tex_conceal= 'adgm'
"hi Conceal guibg=NONE
"hi! link Conceal Operator
"
"syn match texMathSymbol '\\implies\>' contained conceal cchar=⇒

let g:syntastic_quiet_messages = {
    \ "type": "style"
    \}

"let g:syntastic_quiet_messages = {
"    \ "!level": "warnings",
"    \ "type": "style",
"    \ "regex": '.*',
"    \ "file:p": '.*'
"    \}

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=batchmode $*'
let g:Tex_ViewRule_pdf = 'open -a Skim'
nnoremap <leader>ul :w<CR>:silent !pdflatex -synctex=1 --interaction=batchmode %<CR><C-L>
nnoremap <leader>ml :w<CR>:silent !pdflatex -synctex=1 --interaction=batchmode %<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-R>=line('.')<CR> %<.pdf %<CR><C-L>

nnoremap <leader>ba o\begin{align*}<CR>\end{align*}<C-c>
nnoremap <leader>be o\begin{enumerate}<CR>\item<CR>\end{enumerate}<C-c>kk
nnoremap <leader>bf o\begin{figure}[!h]<CR>\centering<CR>\caption{}<CR>\end{figure}<C-c>
nnoremap <leader>bg o\begin{gather*}<CR>\end{gather*}<C-c>
nnoremap <leader>bi o\begin{itemize}<CR>\item<CR>\end{itemize}<C-c>
nnoremap <leader>bq o\begin{equation*}<CR>\end{equation*}<C-c>
nnoremap <leader>bs o\section*{}<C-c>
nnoremap <leader>bt o\begin{tabular}{}<CR>\toprule<CR>\midrule<CR>\bottomrule<CR>\end{tabular}<C-c>

nnoremap <buffer> <leader>c mc0%<C-c>`c

nnoremap j gj
nnoremap k gk
noremap H g^
noremap L g$
inoremap / \
inoremap \ /
inoremap ? $
inoremap $ ?
inoremap ; {
inoremap ' }
inoremap [ ;
inoremap ] '
inoremap : [
inoremap " ]
inoremap { :
inoremap } "
inoremap < _
inoremap > ^
inoremap _ <
inoremap ^ >
vnoremap <D-j> gj
vnoremap <D-k> gk
vnoremap <D-h> g^
vnoremap <D-l> g$
nnoremap <D-j> gj
nnoremap <C-l> <C-c>:w<CR>:AsyncRun pdflatex -synctex=1 --interaction=batchmode %<CR><C-L>
inoremap <C-l> <C-c>:w<CR>:AsyncRun pdflatex -synctex=1 --interaction=batchmode %<CR><C-L>
nnoremap <C-x> <C-c>:w<CR>:AsyncRun xelatex --interaction=batchmode --halt-on-error %<CR><C-L>
inoremap <C-x> <C-c>:w<CR>:AsyncRun xelatex --interaction=batchmode --halt-on-error %<CR><C-L>

function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d '[:space:]'"
    let result = system(cmd)
    echo result . " words"
endfunction

function! CodeMaps()
    iunmap ^
    iunmap _
    iunmap [
    iunmap ]
    iunmap {
    iunmap }
    iunmap ;
    iunmap '
    iunmap :
    iunmap "
    iunmap <
    iunmap >
endfunction

command! WC call WC()
command! CodeMaps call CodeMaps()
