local opts = {
  oceanic_next_terminal_bold = true,
  oceanic_next_terminal_italic = true
}

for key, value in pairs(opts) do
  vim.api.nvim_set_var(key, value)
end

vim.cmd[[colorscheme OceanicNext]]
