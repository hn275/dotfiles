" VUNDLE
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Chiel92/vim-autoformat'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'gregsexton/MatchTag'
Plugin 'akinsho/toggleterm.nvim'
Plugin 'RRethy/vim-illuminate'
Plugin 'lifepillar/vim-mucomplete'
call vundle#end()
filetype plugin indent on

" lua plugin
lua require("init")

" Customized neovim environemt
set number
set relativenumber
filetype indent on
set autoindent
set cursorline
set tabstop=4
set shiftwidth=4
syntax on
let g:currentmode={
			\ 'n'  : 'NORMAL ',
			\ 'v'  : 'VISUAL ',
			\ 'V'  : 'V·Line ',
			\ "\<C-V>" : 'V·Block ',
			\ 'i'  : 'INSERT ',
			\ 'R'  : 'R ',
			\ 'Rv' : 'V·Replace ',
			\ 'c'  : 'Command ',
			\}

" Powerline
"let g:airline_powerline_fonts = 1
"" Color/themes
"let g:airline_theme='base16_nord'
"" Statusline
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols={}
"let g:airline_symbols.branch = ''
"let g:airline_symbols.colnr = ' col:'
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ' ln:'
""let g:airline_symbols.maxlinenr = '☰ '
"let g:airline_symbols.dirty='⚡'

" statusline
" Git branch
function! GitBranch() 
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
" set status line
set statusline=
set statusline+=%{StatuslineGit()}

"Save code folds
augroup remember_folds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent! loadview
augroup END

" Remapping the escape key to `qq`
imap qq <Esc>
vmap qq <Esc>

" MUcomplete
set completeopt+=menuone
