noremap H ^
noremap J mjJ`j
noremap K <nop>
noremap L $
noremap Y y$

nnoremap Q :q<CR>

nnoremap n nzz
nnoremap N Nzz

" use arrow keys for split navigation
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j
nnoremap <Left>  <C-w>h
nnoremap <Right> <C-w>l

noremap ; :
noremap : `
noremap ` "
noremap " ,
noremap M '
noremap , '
noremap ' ;

inoremap <C-j> <C-c>:w<CR>

nnoremap <C-h> <C-o>
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>
nnoremap <C-l> <C-i>
nnoremap <C-q> :lw<CR>

vnoremap > >gv
vnoremap < <gv

" This is actually <C-/>.
nnoremap <silent> <C-_> :let @/=""<CR><C-l>

tnoremap <Esc> <C-\><C-n>

nnoremap <CR> :w<CR>
nnoremap <Tab> za
nnoremap <C-n> :set rnu!<CR>
nnoremap <C-f> :CtrlP<CR>
nnoremap <C-s> :CtrlPLine<CR>

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

noremap <F2> :set list!<CR>
inoremap <F2> <C-o>:set list!<CR>

let mapleader="\<space>"
set notimeout

" copy and paste from clipboard
noremap <leader>c "*y
noremap <leader>p "*p
noremap <leader>P "*P

" cd
nnoremap <leader>d :cd %:h<CR>

nnoremap <leader>q gqq

nnoremap <leader>h mh*`h

" Remove Whitespace
nnoremap <leader>rw :%s/\s\+$//<CR> :nohl<CR> :w<CR>

" access vimrc more easily
" Vimrc EDit
nnoremap <leader>ved :e $MYVIMRC<CR>:nohl<CR>
" Vimrc SPlit
nnoremap <leader>vsp :split $MYVIMRC<CR>:nohl<CR>
" Vimrc SourCe
nnoremap <leader>vsc :source $MYVIMRC<CR>:nohl<CR>

" Tab navigation
noremap <PageUp> gt
noremap <PageDown> gT
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
