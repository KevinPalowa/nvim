local fn = vim.fn

-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)
local plugins = {
	"wbthomason/packer.nvim", -- Have packer manage itself
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	--[[ "andweeb/presence.nvim", -- Discord presence ]]
	"akinsho/toggleterm.nvim", -- Toggle Term
	"windwp/nvim-autopairs", -- autoPairs
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	}, -- gitSign
	"lukas-reineke/indent-blankline.nvim", -- indentline
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	}, -- alpha
	"kyazdani42/nvim-tree.lua", -- nvim Tree
	"folke/which-key.nvim",
	"norcalli/nvim-colorizer.lua",
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	"wakatime/vim-wakatime", -- WakaTime,
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = "markdown",
	},
	-- Color Scheme
	{ "folke/tokyonight.nvim", lazy = true },
	{ "shaunsingh/nord.nvim", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "rmehri01/onenord.nvim", lazy = true },
	{ "morhetz/gruvbox", lazy = true },
	{ "glepnir/zephyr-nvim", lazy = true },
	{ "catppuccin/nvim", lazy = true },
	{ "Everblush/everblush.nvim", lazy = true, name = "everblush" },
	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP

	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason-lspconfig.nvim",
	"williamboman/mason.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"ray-x/lsp_signature.nvim",
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"p00f/nvim-ts-rainbow",

	"windwp/nvim-ts-autotag",
	"nvim-treesitter/playground",

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
	},

	-- Comment
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- bufferline
	{ "akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
	{ "nvim-pack/nvim-spectre", dependencies = "nvim-lua/plenary.nvim" },
	"moll/vim-bbye",

	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}
require("lazy").setup(plugins)
