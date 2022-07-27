vim.cmd[[colorscheme onedark]]

-- setting lua line color
local lualine_status, lualine = pcall(require, 'lualine')
if lualine_status then
  lualine.setup({
    options = {
      theme = "onedark"
    }
  })
else
  return
end
