local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable",
	lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Treesitter
    {
	'nvim-treesitter/nvim-treesitter', 
	build = function()
	    pcall(require('nvim-treesitter.install').update { with_sync = true })
	end,
	dependencies = {
	    'nvim-treesitter/nvim-treesitter-textobjects'
	}
    },
    {'nvim-treesitter/nvim-treesitter-context'},
    {'wellle/targets.vim'},

    -- LSP
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Completion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'L3MON4D3/LuaSnip'},

    -- Navigation
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope.nvim', tag = '0.1.0' },
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {'junegunn/fzf.vim'},
    {'junegunn/fzf'},

    -- UI
    {'dracula/vim', name = 'dracula'},
    {'nvim-lualine/lualine.nvim'},
    {'ryanoasis/vim-devicons'},
    {'kyazdani42/nvim-web-devicons'},
    {'onsails/lspkind.nvim'},
    {
	'goolord/alpha-nvim', 
	dependencies = {'kyazdani42/nvim-web-devicons'},
	config = function()
	    require('alpha').setup(require('alpha.themes.startify').config)
	end
    },

    -- Utilities
    {'hrsh7th/cmp-cmdline'},
    {'github/copilot.vim'},
    {'windwp/nvim-ts-autotag'},
    {'windwp/nvim-autopairs'},
    {'tpope/vim-surround'},
    {'numToStr/Comment.nvim'},
    {'tpope/vim-repeat'},
})
