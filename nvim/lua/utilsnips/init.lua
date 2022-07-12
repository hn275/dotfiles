local options = {
  UltiSnipsExpandTrigger ="<c-b>",
  UltiSnipsJumpForwardTrigger = "<c-n>",
  UltiSnipsJumpBackwardTrigger = "<c-p>",
}

for key, val in pairs(options) do
  vim.api.nvim_set_var(key, val)
end

