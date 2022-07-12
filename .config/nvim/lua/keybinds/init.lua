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
-- BufferLine 
k("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
k("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
k("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
k("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
k("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
k("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
k("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
k("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
k("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)

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
