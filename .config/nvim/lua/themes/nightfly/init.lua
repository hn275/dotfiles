local opts = {
  nightflyCursorColor = 1, -- set cursor color
  nightflyItalics = 1, -- enable nightfly
  nightflyNormalFloat = 1, -- nightfly background color for neovim floating window
  nightflyUnderlineMatchParen = 1, -- underline matching parentheses
  nightflyWinSeparator = 2, -- style of window separator, 0: none, 1: block separator, 2: line separator
}

vim.opt.fillchars = { -- improve win separator for line separator
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

for key, val in pairs(opts) do
  vim.api.nvim_set_var(key, val)
end

-- correct colors for popup menu and eslint windows
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single",
  }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
    border = "single",
  }
)
vim.diagnostic.config({
  float = {
    border = "single"
  }
})

-- correct colors for cmp auto completion popup window
local winhighlight = {
  winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
}
local cmp_status, cmp = pcall(require, "cmp")
if cmp_status then
  cmp.setup({
    window = {
      completion = cmp.config.window.bordered(winhighlight),
      document = cmp.config.window.bordered(winhighlight)
    }
  })
else return
end

vim.cmd[[ colorscheme nightfly ]] -- set color

-- setting lualine color to nightfly as well
local lualine_status, lualine = pcall(require, "lualine")
if lualine_status then
  lualine.setup({
    options = {
      theme = "nightfly"
    }
  })
else
  return
end

