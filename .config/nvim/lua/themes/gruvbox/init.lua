local opts = {
  gruvbox_material_background = "medium", -- "soft" | "medium"| "hard"
  gruvbox_material_better_performance = true
}

for key, value in pairs(opts) do
  vim.api.nvim_set_var(key, value)
end

vim.cmd[[colorscheme gruvbox-material]]

-- set lualine colorscheme
local status, lualine = pcall(require, 'lualine')
if status then
  lualine.setup({
    options = {
      theme = "gruvbox-material"
    }
  })
else
  return
end

