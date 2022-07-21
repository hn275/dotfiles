-- Key map function 
local k = vim.api.nvim_set_keymap

-- Key map options
local opts = { noremap = true, silent = true }

-- Remapping leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode --
-- Navigating between windows
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

k("n", "<leader>bd", ":bd<CR>", opts) -- close buffers
k("n", "<leader>vs", ":vsplit<CR>", opts) -- vertical split


-- BufferLine go to buffer
k("n", "<leader>1", ":lua require('bufferline').go_to_buffer(1, true)<CR>", opts)
k("n", "<leader>2", ":lua require('bufferline').go_to_buffer(2, true)<CR>", opts)
k("n", "<leader>3", ":lua require('bufferline').go_to_buffer(3, true)<CR>", opts)
k("n", "<leader>4", ":lua require('bufferline').go_to_buffer(4, true)<CR>", opts)
k("n", "<leader>5", ":lua require('bufferline').go_to_buffer(5, true)<CR>", opts)
k("n", "<leader>6", ":lua require('bufferline').go_to_buffer(6, true)<CR>", opts)
k("n", "<leader>7", ":lua require('bufferline').go_to_buffer(7, true)<CR>", opts)
k("n", "<leader>8", ":lua require('bufferline').go_to_buffer(8, true)<CR>", opts)
k("n", "<leader>9", ":lua require('bufferline').go_to_buffer(9, true)<CR>", opts)

-- TodoComment
-- The options are TodoQuickFix, TodoLocList, and TodoTelescope
k("n", "<leader>ft", ":TodoTelescope<CR>", opts) -- mapping for TodoTelescope
-- Telescope
k("n", "<leader>ff", ":Telescope find_files<CR>", opts)
k("n", "<leader>fg", ":Telescope live_grep<CR>", opts)


-- Nvim treesitter 
k("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Navigating Tabs 
k("n", "<leader>l", ":bn<CR>", opts)
k("n", "<leader>h", ":bp<CR>", opts)

-- Visual Mode --
-- stay in indent mode 
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- Insert mode 
k("i", "<C-f>", "<Esc>:Autoformat<CR>", opts)
