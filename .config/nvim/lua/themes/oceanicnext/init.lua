local opts = {
  oceanic_next_terminal_bold = true,
  oceanic_next_terminal_italic = true
}

for key, value in pairs(opts) do
  vim.api.nvim_set_var(key, value)
end

vim.cmd[[colorscheme OceanicNext]]

-- set lualine color
local lualine_status, lualine = pcall(require, 'lualine')
if lualine_status then
  lualine.setup({
    options = {
      theme = "OceanicNext"
    }
  })
else
  return
end
