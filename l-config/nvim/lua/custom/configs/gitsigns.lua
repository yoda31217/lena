local gitsigns_config = require("plugins.configs.others").gitsigns

gitsigns_config.signs = {
	add = { text = "│" },
	change = { text = "│" },
	delete = { text = "_" },
	topdelete = { text = "‾" },
	changedelete = { text = "~" },
	untracked = { text = "┆" },
}
