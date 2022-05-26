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
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/lightline.vim'
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

" Color scheme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark

" statusline
" " functions
" " Git Branch
" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0 ? '  '.l:branchname.' ':''
" endfunction

" " Defining mode colors
" hi NormalColor ctermfg=239 ctermbg=87
" hi InsertColor ctermfg=255 ctermbg=33
" hi ReplaceColor ctermfg=255 ctermbg=9
" hi VisualColor ctermfg=255 ctermbg=135
" function! s:ModeColor() 
" 	set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
" 	set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
" 	set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
" 	set statusline+=%#VisualColor#%{(mode()=='V')?'\ \ VISUAL\ ':''}
" 	set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
" endfunction

" " Set colors
" hi GitColor ctermfg=255 ctermbg=234
" hi Background ctermfg=239 ctermbg=153
" hi PmenuSel ctermfg=188 ctermbg=239

" " statusline configiration
" set laststatus=2
" set statusline= 
" " Set colors based on mode 
" call s:ModeColor()
" set statusline+=%#Background# 
" set statusline+=\ %f\ 	" File name
" set statusline+=%#PmenuSel#
" set statusline+=\ %y 	" File type
" set statusline+=%m 		" Read only flag and Modified flag
" set statusline+=%{StatuslineGit()}
" set statusline+=%=
" set statusline+=%#GitColor#
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\ 
" set statusline+=\ %p%%\ 
" set statusline+=\ %l:%c\ 
let g:lightline = {
		\'colorscheme':'one',
	\}
