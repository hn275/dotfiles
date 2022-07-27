-- Color correction
vim.cmd[[
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif
set background=dark
]]


-- require("themes.deepspace")
-- require("themes.dracula")
require("themes.everforest")
-- require("themes.gruvbox")
-- require("themes.nightfly")
-- require("themes.nightfox")
-- require("themes.nord")
-- require("themes.oceanicnext")
-- require("themes.onedark")
-- require("themes.tokyonight")
