-- ensure lazy.nvim is installed
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
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	--[[ "andweeb/presence.nvim", -- Discord presence ]]
	"akinsho/toggleterm.nvim", -- Toggle Term
	"windwp/nvim-autopairs", -- autoPairs
	"tpope/vim-fugitive", -- Git commands in nvim
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	}, -- gitSign
	"github/copilot.vim",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			branch = "main",
			dependencies = {
				{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
				{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
			},
			build = "make tiktoken", -- Only on MacOS or Linux
			opts = {
				-- See Configuration section for options
			},
			-- See Commands section for default commands if you want to lazy load on them
		},
	},
	"jose-elias-alvarez/typescript.nvim",
	--[[ { ]]
	--[[ 	"pmizio/typescript-tools.nvim", ]]
	--[[ 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" }, ]]
	--[[ 	config = function() ]]
	--[[ 		require("typescript-tools").setup({}) ]]
	--[[ 	end, ]]
	--[[ }, ]]
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	}, -- alpha
	"folke/which-key.nvim",
	"norcalli/nvim-colorizer.lua",
	{
		--[[ "folke/noice.nvim", ]]
		--[[ config = function() ]]
		--[[ 	require("noice").setup({ ]]
		--[[ 		lsp = { ]]
		--[[ 			-- override markdown rendering so that **cmp** and other plugins use **Treesitter** ]]
		--[[ 			override = { ]]
		--[[ 				["vim.lsp.util.convert_input_to_markdown_lines"] = true, ]]
		--[[ 				["vim.lsp.util.stylize_markdown"] = true, ]]
		--[[ 				["cmp.entry.get_documentation"] = true, ]]
		--[[ 			}, ]]
		--[[ 		}, ]]
		--[[ 		-- you can enable a preset for easier configuration ]]
		--[[ 		presets = { ]]
		--[[ 			bottom_search = true, -- use a classic bottom cmdline for search ]]
		--[[ 			command_palette = true, -- position the cmdline and popupmenu together ]]
		--[[ 			long_message_to_split = true, -- long messages will be sent to a split ]]
		--[[ 			inc_rename = false, -- enables an input dialog for inc-rename.nvim ]]
		--[[ 			lsp_doc_border = false, -- add a border to hover docs and signature help ]]
		--[[ 		}, ]]
		--[[ 	}) ]]
		--[[ end, ]]
		--[[ dependencies = { ]]
		--[[ 	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries ]]
		--[[ 	"MunifTanjim/nui.nvim", ]]
		--[[ 	-- OPTIONAL: ]]
		--[[ 	--   `nvim-notify` is only needed, if you want to use the notification view. ]]
		--[[ 	--   If not available, we use `mini` as the fallback ]]
		--[[ 	"rcarriga/nvim-notify", ]]
		--[[ }, ]]
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
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
	{
		"akinsho/flutter-tools.nvim",
		ft = { "dart" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			local ok, flutter_tools = pcall(require, "flutter-tools")
			if not ok then
				return
			end
			local handlers = require("kevin.lsp.handlers")
			flutter_tools.setup({
				ui = {
					border = "rounded",
					notification_style = "plugin",
				},
				decorations = {
					statusline = {
						app_version = true,
						device = true,
					},
				},
				widget_guides = { enabled = true },
				lsp = {
					color = {
						enabled = true,
						background = true,
						virtual_text = true,
					},
					on_attach = handlers.on_attach,
					capabilities = handlers.capabilities,
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({
				ui = {
					kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
				},
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		branch = "legacy",
		config = function()
			require("fidget").setup({
				window = {
					blend = 0,
				},
			})
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
