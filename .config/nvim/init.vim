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
Plugin 'itchyny/vim-gitbranch'
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
" Git Branch
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? '  '.l:branchname.' ':''
endfunction

let g:lightline = {
	  \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
	  \ 'gitbranch': 'StatuslineGit',
      \ },
      \ }

" Color scheme
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark

