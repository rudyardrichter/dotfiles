autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd TextChangedI * call ncm2#auto_trigger()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
let ncm2#popup_delay = 0
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" disable language client completion, we already get these from jedi
call ncm2#override_source('LanguageClient_python', {'enable': 0})
let g:jedi#completions_enabled = 0
