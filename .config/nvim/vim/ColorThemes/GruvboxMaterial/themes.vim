" Color correction 
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Set dark mode
set background=dark

" Contrast
let g:gruvbox_material_background = 'medium'

" Better performace
let g:gruvbox_material_better_performace = 1

" Set color themes
colorscheme gruvbox-material 
