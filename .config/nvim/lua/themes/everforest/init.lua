local opts = {
  everforest_background = "hard", -- "hard" | "medium" | "soft"
  everforest_italic = 0, -- only used for cursive font
  everforest_italic_comment = 0, -- 0 is enable
  everforest_cursor = "auto", -- only works in GUI client
  everforest_better_perfomance = 1, -- this theme is heavy af apprently, this reduce startup time for this theme by roughly 50%
  everforest_ui_contrast = "high", -- "high" | "low"
  everforst_transparent_background = 2, -- 2 for more ui components to be transparent
}

for key, val in pairs(opts) do
  vim.api.nvim_set_var(key, val)
end

vim.cmd[[ colorscheme everforest ]] -- set colorscheme

-- enable lualine color theme
local lualine_status, lualine = pcall(require, 'lualine')
if lualine_status then
  lualine.setup({
    options = {
      theme = "everforest"
    }
  })
else
  return
end
