require("plugins.plugins")
require("toggle_term")
require("indent_blankline.indent")
require("nvim_tree")
require("env_setting")
require("keybinds")
require("markdown_preview")
require("lua_line")
require("buffer_line")
require("telescope.telescope")
require("todo_comments")
require("cmp.cmp")
require("lsp_config")
require("tree_sitter")
require("themes")


-- fixing that weird padding issues
function Sad(line_nr, from, to, fname)
  vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname))
end

function IncreasePadding()
  Sad('07', 0, 20, '~/.config/alacritty/alacritty.yml')
  Sad('08', 0, 20, '~/.config/alacritty/alacritty.yml')
end

function DecreasePadding()
  Sad('07', 20, 0, '~/.config/alacritty/alacritty.yml')
  Sad('08', 20, 0, '~/.config/alacritty/alacritty.yml')
end

vim.cmd[[
augroup ChangeAlacrittyPadding
au!
au VimEnter * lua DecreasePadding()
au VimLeavePre * lua IncreasePadding()
augroup END
]]

