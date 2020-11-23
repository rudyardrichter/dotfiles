if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ale#enabled = 0
let g:airline_skip_empty_sections = 1
let g:enable_powerline_symbols = 0
if g:enable_powerline_symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
else
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = '|'
endif
let g:airline_symbols.branch = ''
let g:airline#extensions#branch#empty_message = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = ''
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_x = ''
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'
let g:airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%4l:%-3.v / %#__accent_bold#%L%#__restore__#'
"let g:airline_section_z = '%4l:%=%-3.v'
