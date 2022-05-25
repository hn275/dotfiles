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
Plugin 'gregsexton/MatchTag'
Plugin 'RRethy/vim-illuminate'
Plugin 'akinsho/toggleterm.nvim'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'iamcco/markdown-preview.nvim'
call vundle#end()
filetype plugin indent on

" Customized neovim environemt
set number
set relativenumber
filetype indent on
set autoindent
set cursorline
set tabstop=4
set shiftwidth=4
syntax on

" Save code folds
augroup AutoSaveFolds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent! loadview
augroup END

" Remapping the escape key to `ii`
imap ii <Esc>
vmap ii <Esc>

" Autocomplete
set completeopt+=menuone
set completeopt+=noselect

" sourcing init.lua
lua require('init') 

" statusline
" functions
" Git Branch
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? '  '.l:branchname.' ':'  '
endfunction

" Set colors
hi NormalColor ctermfg=239 ctermbg=87
hi InsertColor ctermfg=255 ctermbg=33
hi ReplaceColor ctermfg=255 ctermbg=9
hi VisualColor ctermfg=255 ctermbg=135
hi GitColor ctermfg=255 ctermbg=234
hi Background ctermfg=239 ctermbg=153
hi PmenuSel ctermfg=188 ctermbg=239
" statusline configiration
set statusline= 
set laststatus=2
" mode colors
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisualColor#%{(mode()=='V')?'\ \ VISUAL\ ':''}
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
" mode colors ends
set statusline+=%#Background# 
set statusline+=\ %f\ 	" File name
set statusline+=%#PmenuSel#
set statusline+=\ %y 	" File type
set statusline+=%m 		" Read only flag and Modified flag
set statusline+=%=
" set statusline+=%* 		" Resetting Color
set statusline+=%#GitColor#
set statusline+=\ %{StatuslineGit()}\ 
set statusline+=%#Background#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\ 
set statusline+=%#Background#
set statusline+=\ %p%%\ 
set statusline+=%#Background#
set statusline+=\ %l:%c\ 

