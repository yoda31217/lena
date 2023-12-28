local treesitter_config = require("plugins.configs.treesitter")

treesitter_config.ensure_installed = {
	"vim",
	"lua",
	"html",
	"css",
	"javascript",
	"typescript",
	"tsx",
	"json",
	"java",
	"c",
	"zig",
}

treesitter_config.incremental_selection = {
	enable = true,
	keymaps = {
	},
}
