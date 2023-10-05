-- Help docs:
-- https://github.com/mfussenegger/nvim-jdtls
-- https://github.com/eclipse-jdtls/eclipse.jdt.ls
-- https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations
-- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line
-- https://github.com/Nawy/nvim-config-examples/blob/main/lsp-java/ftplugin/java.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
local config = {
	cmd = {
		vim.fn.stdpath("data") .. "/mason/packages/jdtls/bin/jdtls",
		"--jvm-arg=-Dlog.protocol=true",
		"--jvm-arg=-Dlog.level=ALL",
		"--jvm-arg=-javaagent:" .. vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar",
		-- "-data", "... WE NEED TO SET UP IT IN FUTURE; CURRENTLY UNIQUE PER PROJECT FOLDER NAME ",
	},
	root_dir = vim.fn.getcwd(),

	settings = {
		java = {
			errors = {
				incompleteClasspath = {
					severity = "warning",
				},
			},
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				maven = {
					userSettings = nil,
				},
			},
			trace = {
				server = "verbose",
			},
			import = {
				gradle = {
					enabled = true,
				},
				maven = {
					enabled = true,
				},
				exclusions = {
					"**/node_modules/**",
					"**/.metadata/**",
					"**/archetype-resources/**",
					"**/META-INF/maven/**",
					"/**/test/**",
				},
			},
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			format = {
				enabled = true,
			},
			saveActions = {
				organizeImports = false,
			},
			contentProvider = {
				preferred = nil,
			},
			autobuild = {
				enabled = false,
			},
			references = {
				includeDecompiledSources = true,
			},
			signatureHelp = { enabled = true },
			completion = {
				favoriteStaticMembers = {
					"org.junit.Assert.*",
					"org.junit.Assume.*",
					"org.junit.jupiter.api.Assertions.*",
					"org.junit.jupiter.api.Assumptions.*",
					"org.junit.jupiter.api.DynamicContainer.*",
					"org.junit.jupiter.api.DynamicTest.*",
				},
				importOrder = {
					"java",
					"javax",
					"com",
					"org",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
		},
	},
}

require("jdtls").start_or_attach(config)
