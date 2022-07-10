" Color correction 
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set background=dark

" --- Deepspace ---
colorscheme deep-space
let g:deepspace_italics=1
let g:airline_theme="deep_space"

" --- Gruvbox ---
" " Contrast
" let g:gruvbox_material_background = 'medium' " soft | medium | hard
" let g:gruvbox_material_better_performace = 1 " better performace
"  let g:airline_theme="base16_gruvbox_dark_hard" " setting airline theme
" colorscheme gruvbox-material 
