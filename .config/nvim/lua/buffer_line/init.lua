local bufferLine = require('bufferline')

bufferLine.setup {
  options = {
    mode = 'buffers',
    numbers = 'ordinal',
    max_name_length = 15,
    max_prefix_length = 10,
    tab_size = 18,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = true,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'Nvim Tree',
        highlight = 'Directory',
        text_align = 'left'
      }
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    separator_style = 'thin', -- Acceptable values are: thick | thin | slant
    always_show_bufferline = false,
  }
}


-- key binding is in lua/keybindings/init.lua
