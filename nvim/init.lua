-- this has to go before mappings to set leader
require("options")

require("gruvbox").setup()
-- vim.cmd("colorscheme gruvbox")

require("mappings")

-- This fixes an issue with guibg highlight interfering with cursorline
-- https://github.com/neovim/neovim/issues/9019
vim.cmd[[
function! s:CustomizeColors()
	if has('guirunning') || has('termguicolors')
		let cursorline_gui=''
		let cursorline_cterm='ctermfg=white'
	else
		let cursorline_gui='guifg=white'
		let cursorline_cterm=''
	endif
	exec 'hi CursorLine ' . cursorline_gui . ' ' . cursorline_cterm
endfunction

augroup OnColorScheme
	autocmd!
	autocmd ColorScheme,BufEnter,BufWinEnter * call s:CustomizeColors()
augroup END
]]

vim.cmd[[
autocmd BufNewFile *.py 0r ~/.config/nvim/skeletons/skeleton.py
]]

vim.cmd("syntax off")
