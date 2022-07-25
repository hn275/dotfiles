local opts = {
  gruvbox_material_background = "medium", -- "soft" | "medium"| "hard"
  gruvbox_material_better_performance = true
}

for key, value in pairs(opts) do
  vim.api.nvim_set_var(key, value)
end

