local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}
-- Install your plugins here
return packer.startup(function(use)

    -- SO MANY PLUGINS REQUIRE THESE, JUST HAVE THEM UP HERE --
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use 'kyazdani42/nvim-web-devicons' -- So many plugins require this

    -- useins
    use "wbthomason/packer.nvim" -- have packer manages itself
    -- use { "neoclide/coc.nvim", branch = "release" } -- coc
    use "Chiel92/vim-autoformat" -- Autoformat
    use "mattn/emmet-vim" -- emmet-vim for html tags
    use "jiangmiao/auto-pairs" -- auto pairs
    use "gregsexton/MatchTag" -- html tags highlighting
    use "RRethy/vim-illuminate" -- variables highlighting
    use "akinsho/toggleterm.nvim" -- toggle term
    use "tpope/vim-commentary" -- comment toggler
    use "nvim-telescope/telescope.nvim" -- telescope
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- nvim treesitter
    -- use "folke/todo-comments.nvim" -- todo-comments
    use "lukas-reineke/indent-blankline.nvim" -- blank indentation
    use {'akinsho/bufferline.nvim', tag = "v2.*" } -- bufferline
    use { "nvim-lualine/lualine.nvim", requires = { opt = true } } -- lua line

    -- cmp stuff
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'

    -- Markdown preview --
    use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })

    -- nvim tree sitter --
    use "sheerun/vim-polyglot"
    use "itchyny/vim-gitbranch"
    use "kyazdani42/nvim-tree.lua"
    use "ryanoasis/vim-devicons"

    -- Language syntax specific --
    use "yuezk/vim-js"
    use "maxmellon/vim-jsx-pretty"
    use "ap/vim-css-color"

    -- Snippets
    -- use "SirVer/ultisnips"
    -- use 'mlaursen/vim-react-snippets'
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    --
    -- Themes plugins
    use "sainnhe/gruvbox-material"
    use "joshdick/onedark.vim"
    use "edkolev/tmuxline.vim"
    use "rakr/vim-one"
    use 'liuchengxu/space-vim-dark'
    use "tyrannicaltoucan/vim-deep-space"
    use 'folke/tokyonight.nvim'
    use 'mhartington/oceanic-next'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
