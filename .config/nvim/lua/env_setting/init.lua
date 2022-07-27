local options = {
	backup = false, -- creates backup
	-- clipboard = "unnamedplus", -- allow accessing the clipboard for neovim
	cmdheight = 1, -- adding height to the command line
	conceallevel = 0, -- making `` visible in markdown files
	fileencoding = "utf-8",
	hlsearch = true, -- highlight all matched search
	ignorecase = true, -- ignore case in search pattern
	pumheight = 10, -- pop up menu height
	showmode = false, -- mode is displayed in the status line already
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	autoindent = true, -- automatically apply indentation from the last line to the next line
	smartindent = false, -- enabling smart indent
	splitbelow = true, -- new vsplit is forced to opened up below
	splitright = true, -- new hsplit is forced to opened up to the right
	swapfile = false, -- prevent creating swap files
	termguicolors = true, -- set term gui colors
	timeoutlen = 1000, -- time to wait for a mapped sequence to reset
	undofile = true, -- persistent undo
	updatetime = 300, -- faster completion (4000ms by default)
	writebackup = false, -- if a file is being edited by another program, or was written by another program, wont be allowed to write
	expandtab = true, -- expanding tab to spaces
	shiftwidth = 2, -- number of spaces indented
	tabstop = 2, -- number of spaces tab key inserts
	cursorline = false, -- highlighting current cursor lines
	cursorcolumn = false, -- highlight current cursor column
	number = true, -- line number
	relativenumber = true, -- enable relative number
	numberwidth = 3, -- set number column width
	signcolumn = "yes:1", -- show sign column when there is a sign
	wrap = false, -- no wrapping,
	foldmethod = "syntax", -- setting fold method
	foldcolumn = "1", -- dedicated column for fold symbols
	foldlevelstart = 999, -- always open all folds when entering a file
}

vim.opt.shortmess:append "c"

for key, val in pairs(options) do
	vim.opt[key] = val
end

-- vim.cmd [[Tmuxline airline_insert]] -- setting tmux color to be the same as airline bar in insert mode
vim.cmd [[set iskeyword+=-]] -- turn key-word into 1 word for `dw` instead of 2 (by default neovim reads words-like-this 3 words)

vim.cmd [[ autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */} ]]
