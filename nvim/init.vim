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
" functions
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? ' '.l:branchname.' ':''
endfunction

" Set mode colors
hi NormalColor ctermfg=255 ctermbg=102
hi InsertColor ctermfg=239 ctermbg=45
hi ReplaceColor ctermfg=239 ctermbg=187
hi VisualColor ctermfg=239 ctermbg=131

" statusline configiration
set statusline= 
set laststatus=2
" mode colors
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='q')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisualColor#%{(mode()=='V')?'\ \ VISUAL\ ':''}
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
" mode colors ends
set statusline+=%#PmenuSel#
set statusline+=\ %{StatuslineGit()}
set statusline+=\ %f\ %y
set statusline+=\ %m " Read only flag and Modified flag
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
