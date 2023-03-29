--[[ local status_ok, neotree = pcall(require, "neo-tree") ]]
--[[ if not status_ok then ]]
--[[ 	return ]]
--[[ end ]]
local neotree = require("neo-tree")

neotree.setup({
	default_component_configs = {
		git_status = {
			symbols = {
				-- Change type
				added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
	},
	window = {
		width = 30,
		mappings = {
			["l"] = "open",
		},
	},
	event_handlers = {
		{
			event = "file_opened",
			handler = function(file_path)
				--auto close
				require("neo-tree").close_all()
			end,
		},
	},
})
