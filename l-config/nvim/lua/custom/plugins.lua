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
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"html-lsp",
				"eslint-lsp",
				"prettier",
				"stylua",
				"typescript-language-server",
			},
		},
	},
}

return plugins
