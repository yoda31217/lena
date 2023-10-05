-- require("core.bootstrap").echo("asdasdasd" .. "123123")

-- vim.notify("This is java file")

local config = {
	cmd = {
		"/Users/niknik/.local/share/nvim/mason/packages/jdtls/bin/jdtls",
		"--jvm-arg=-Dlog.protocol=true -Dlog.level=ALL -javaagent:/Users/niknik/.local/share/nvim/mason/packages/jdtls/lombok.jar",
		-- "-data",
		-- "/Users/niknik/Documents/projects/thingsteam/best-goods/.lena/nvim/mason/packages/jdtls/data",
	},
	root_dir = "/Users/niknik/Documents/projects/thingsteam/best-goods",

	settings = {
		java = {
			-- home = "/usr/local/jdk-9.0.1",
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
