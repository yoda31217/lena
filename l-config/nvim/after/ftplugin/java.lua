local jdtls = require("jdtls")
local utils = require("core.utils")

-- Help docs:
-- https://github.com/mfussenegger/nvim-jdtls
-- https://github.com/eclipse-jdtls/eclipse.jdt.ls
-- https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations
-- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line
-- https://github.com/Nawy/nvim-config-examples/blob/main/lsp-java/ftplugin/java.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
-- https://github.com/IlyasYOY/dotfiles/tree/master/config/nvim
local config = {
	cmd = {
		vim.fn.stdpath("data") .. "/mason/packages/jdtls/bin/jdtls",
		"--jvm-arg=-Dlog.protocol=true",
		"--jvm-arg=-Dlog.level=ALL",
		"--jvm-arg=-javaagent:" .. vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar",
		-- "-data", "... WE NEED TO SET UP IT IN FUTURE; CURRENTLY UNIQUE PER PROJECT FOLDER NAME ",
	},
	root_dir = vim.fn.getcwd(),

	settings = { java = {} },

	on_attach = function(_, buffer)
		utils.load_mappings("lspconfig", { buffer = buffer })
	end,
}

jdtls.start_or_attach(config)
