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

" --- One Dark ---
" colorscheme onedark
 
" --- Deepspace ---
" colorscheme deep-space
" let g:deepspace_italics=1

" --- Gruvbox ---
" " Contrast
" let g:gruvbox_material_background = 'medium' " soft | medium | hard
" let g:gruvbox_material_better_performace = 1 " better performace
" colorscheme gruvbox-material 

" --- Tokyo Night ---
colorscheme tokyonight

" --- Oceanic next ---
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext 
