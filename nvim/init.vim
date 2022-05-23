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
Plugin 'RRethy/vim-illuminate'
Plugin 'akinsho/toggleterm.nvim'
Plugin 'lifepillar/vim-mucomplete'
call vundle#end()
filetype plugin indent on

" Customized neovim environemt
set relativenumber
filetype indent on
set autoindent
set cursorline
set tabstop=4
set shiftwidth=4
syntax on

" let g:currentmode={
" 			\ 'n'  : 'NORMAL ',
" 			\ 'v'  : 'VISUAL ',
" 			\ 'V'  : 'V·Line ',
" 			\ "\<C-V>" : 'V·Block ',
" 			\ 'i'  : 'INSERT ',
" 			\ 'R'  : 'R ',
" 			\ 'Rv' : 'V·Replace ',
" 			\ 'c'  : 'Command ',
" 			\}

" Save code folds
augroup AutoSaveFolds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent! loadview
augroup END

" Remapping the escape key to `qq`
imap qq <Esc>
vmap qq <Esc>

" Autocomplete
set completeopt+=menuone
set completeopt+=noselect

" sourcing init.lua
lua require('init') 

" statusline
set laststatus=2
" functions
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? ' '.l:branchname.' ':''
endfunction

" Set mode colors
hi StatusLine ctermfg=100 ctermbg=122
hi NormalColor ctermfg=50 
hi InsertColor ctermfg=223 
hi ReplaceColor ctermfg=87 
hi VisualColor ctermfg=50 

" statusline configiration
set statusline= 
" mode colors
" set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
" set statusline+=%#InsertColor#%{(mode()=='r')?'\ \ INSERT\ ':''}
" set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
" set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
" set statusline+=%#VisualColor#%{(mode()=='V')?'\ \ VISUAL\ ':''}
" mode colors ends
set statusline+=%{StatuslineGit()}
set statusline+=\ %f\ %y
set statusline+=
