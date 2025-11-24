local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local icons = require("which-key.icons")
icons.providers = vim.tbl_filter(function(provider)
	return provider.name ~= "mini.icons"
end, icons.providers)

local mappings = {
	{
		mode = "n",
		nowait = true,
		silent = true,
		noremap = true,
		{ "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" },
		{
			"<leader>b",
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			desc = "Buffers",
		},
		{ "<leader>e", "<cmd>Neotree reveal toggle<cr>", desc = "Explorer" },
		{ "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
		{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
		{
			"<leader>f",
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false}) <cr>",
			desc = "Find files",
		},
		{ "<leader>F", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
		{
			"<leader>P",
			"<cmd>lua require('telescope').extensions.projects.projects()<cr>",
			desc = "Projects",
		},
		{ "<leader>c", group = "Copilot" },
		{ "<leader>cc", "<cmd>CopilotChatToggle <cr>", desc = "Copilot Toggle" },
		{ "<leader>ce", "<cmd>CopilotChatExplain <cr>", desc = "Copilot Explain" },
		{ "<leader>cf", "<cmd>CopilotChatFix <cr>", desc = "Copilot Fix" },
		{ "<leader>p", group = "Plugin" },
		{ "<leader>pc", "<cmd>Lazy check<cr>", desc = "Check Update" },
		{
			"<leader>pC",
			"<cmd>Lazy check<cr>",
			desc = "Clean plugins that are no longer needed",
		},
		{ "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install" },
		{ "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync" },
		{ "<leader>pS", "<cmd>Lazy home<cr>", desc = "Status" },
		{ "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update" },
		{ "<leader>g", group = "Git" },
		{ "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
		{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
		{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
		{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
		{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
		{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
		{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
		{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
		{
			"<leader>gu",
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			desc = "Undo Stage Hunk",
		},
		{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
		{
			"<leader>gd",
			"<cmd>Gitsigns diffthis HEAD<cr>",
			desc = "Diff",
		},
		{ "<leader>l", group = "LSP" },
		{ "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
		{
			"<leader>ld",
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			desc = "Document Diagnostics",
		},
		{
			"<leader>lw",
			"<cmd>Telescope diagnostics<cr>",
			desc = "Workspace Diagnostics",
		},
		{ "<leader>lf", "<cmd>lua vim.lsp.buf.format {async=false}<cr>", desc = "Format" },
		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
		{ "<leader>lI", "<cmd>Mason<cr>", desc = "Installer Info" },
		{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
		{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
		{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
		{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
		{ "<leader>lr", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
		{ "<leader>lR", "<cmd>Telescope lsp_references<CR>", desc = "References" },
		{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
		{
			"<leader>lS",
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			desc = "Workspace Symbols",
		},
		{ "<leader>lt", "<cmd>TroubleToggle<cr>", desc = "Trouble" },
		{ "<leader>s", group = "Search" },
		{ "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
		{ "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
		{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>t", group = "Terminal" },
		{ "<leader>tn", "<cmd>TermExec cmd='node'<cr>", desc = "Node" },
		{ "<leader>tt", "<cmd>TermExec cmd='htop'<cr>", desc = "Htop" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
		{
			"<leader>th",
			"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
			desc = "Horizontal",
		},
		{
			"<leader>tv",
			"<cmd>ToggleTerm size=80 direction=vertical<cr>",
			desc = "Vertical",
		},
	},
}

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	keys = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	win = {
		border = "rounded", -- none, single, double, shadow
		padding = { 2, 2 }, -- extra window padding [top/bottom, right/left]
		wo = {
			winblend = 0,
		},
	},
	layout = {
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
	},
	filter = function(mapping)
		if mapping.group then
			return true
		end
		return mapping.desc ~= nil and mapping.desc ~= ""
	end,
	show_help = true, -- show help message on the command line when the popup is visible
	spec = mappings,
}

which_key.setup(setup)
