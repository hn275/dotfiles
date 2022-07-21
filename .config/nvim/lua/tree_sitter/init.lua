local status, tree = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

-- Syntax highlighting configs
local highlight_parsers = { -- enabled languages parsers
  "javascript",
  "typescript",
  "tsx",
  "json",
  "html",
  "bash",
  "cpp",
  "css",
  "lua",
  "markdown",
  "python",
  "rasi",
  "scss",
  "regex",
  "vim",
}

-- Autotag configs
local autotag_filetypes = { -- enabled file types
  "html",
  "javascript", "javascriptreact", "jsx",
  "typescript", "typescriptreact", "tsx",
  "xml",
  "markdown"
}
local skip_tags = { -- disable for these tags
  "area",
  "input",
  "hr",
  "br",
  "hr",
  "img",
  "param",
}

-- context-commentstring configuration
local context_commentstring_config = require("tree_sitter.ts_context_commentstring")

tree.setup({
  ensure_installed = highlight_parsers, -- install all parsers name
  highlight = {
    enable = true, -- enabling highlight
    additional_vim_regex_highlighting = true, -- may slow neovim, well shall see
  },
  indent = {
    enable = true, -- enable auto indentation
  },
  autotag = {
    enable = true, -- enabling tag completion
    filetypes = autotag_filetypes, -- auto enable on these filetypes
  },
  context_commentstring = {
    enable = true, -- enable ts_context_commentstring
    config = context_commentstring_config, -- config
  }
})
