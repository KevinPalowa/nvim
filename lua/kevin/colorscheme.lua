--[[ local colorscheme = "catppuccin" ]]
--[[ local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) ]]
--[[ if not status_ok then ]]
--[[ 	vim.notify("colorscheme " .. colorscheme .. " not found!") ]]
--[[ 	return ]]
--[[ end ]]
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
local colors = require("catppuccin.palettes").get_palette()
require("catppuccin").setup({
	transparent_background = true,
	styles = {},
	integrations = {
		ts_rainbow = true,
		lsp_saga = true,
		treesitter = true,
		fidget = true,
		treesitter_context = true,
		telescope = true,
		which_key = true,
		neotree = true,
		mason = true,
		cmp = true,
		lsp_trouble = true,
	},
	--[[ custom_highlights = { ]]
	--[[ 	["@constructor.tsx"] = { fg = colors.peach }, ]]
	--[[ 	["@keyword"] = { fg = colors.red }, ]]
	--[[ 	["@parameter"] = { fg = "#ffffff" }, ]]
	--[[ 	["@function"] = { style = { "italic" } }, ]]
	--[[ 	["@tag.attribute.tsx"] = { fg = colors.blue, style = { "italic" } }, ]]
	--[[ 	["@variable"] = { style = { "italic" } }, ]]
	--[[ 	["@keyword.return"] = { fg = colors.sky, style = { "bold" } }, ]]
	--[[ }, ]]
})
vim.api.nvim_command("colorscheme catppuccin")
-- Lua
--[[ require("onedark").setup({ ]]
--[[ 	style = "deep", ]]
--[[ 	code_style = { ]]
--[[ 		comments = "italic", ]]
--[[ 		keywords = "none", ]]
--[[ 		functions = "none", ]]
--[[ 		strings = "none", ]]
--[[ 		variables = "none", ]]
--[[ 	}, ]]
--[[ }) ]]
--[[ require("onedark").load() ]]
