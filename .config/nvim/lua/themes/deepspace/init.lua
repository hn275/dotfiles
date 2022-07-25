local opts = {
  deepspace_italic = true
}

for key, value in pairs(opts) do
  vim.api.nvim_set_var(key, value)
end

vim.cmd[[colorscheme deep-space]]
