require("custom.configs.treesitter")
require("custom.configs.nvimtree")
require("custom.configs.blankline")

local plugins = {
	-- Skeleton of this plugin configuration copy-pasted from NvChad
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},

		init = function()
			require("core.utils").lazy_load("nvim-lspconfig")
		end,

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
