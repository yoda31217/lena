require("custom.configs.treesitter")
require("custom.configs.nvimtree")
require("custom.configs.blankline")

local plugins = {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},

		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	{
		"mfussenegger/nvim-jdtls",
	},
}

return plugins
