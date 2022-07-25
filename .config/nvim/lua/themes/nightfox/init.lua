local status, nightfox = pcall(require, "nightfox")
if not status then return end

nightfox.setup({
  options = {
    transparent = false, -- disable setting background
    terminal_colors = true, -- set terminal color
    dim_inactive = true, -- dim unfocus panes
    styles = { -- see `:h attr-list` for help
      comments = "italic",
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "bold",
    }
  }
})


vim.cmd("colorscheme nordfox")
