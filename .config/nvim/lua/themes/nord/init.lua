local opts = {
  nord_contrast = true,
  nord_borders = true,
  nord_disable_background = false,
  nord_cursorline_transparent = false,
  nord_enable_sidebar_background = false,
  nord_italic = false,
  nord_uniform_diff_background = true, -- colorful background when used in diff
}

for key, val in pairs(opts) do
  vim.api.nvim_set_var(key, val)
end

vim.cmd[[colorscheme nord]]

-- dont forget to set lualine theme to nord as well
