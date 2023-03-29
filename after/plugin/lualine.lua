local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
local function server()
	local clients = vim.lsp.buf_get_clients()
	local client_names = {}
	for _, client in pairs(clients) do
		table.insert(client_names, client.name)
	end
	local result = table.concat(client_names, ", ")
	return result
end
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "alpha", "TelescopePrompt", "neo-tree", "mason", "lspinfo", "spectre_panel" },
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
