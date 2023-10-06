local jdtls = require("jdtls")

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

	settings = {
		java = {
			-- errors = {
			-- 	incompleteClasspath = {
			-- 		severity = "warning",
			-- 	},
			-- },
			-- eclipse = {
			-- 	downloadSources = true,
			-- },
			-- configuration = {
			-- 	updateBuildConfiguration = "interactive",
			-- 	maven = {
			-- 		userSettings = nil,
			-- 	},
			-- },
			-- trace = {
			-- 	server = "verbose",
			-- },
			-- import = {
			-- 	gradle = {
			-- 		enabled = true,
			-- 	},
			-- 	maven = {
			-- 		enabled = true,
			-- 	},
			-- 	exclusions = {
			-- 		"**/node_modules/**",
			-- 		"**/.metadata/**",
			-- 		"**/archetype-resources/**",
			-- 		"**/META-INF/maven/**",
			-- 		"/**/test/**",
			-- 	},
			-- },
			-- maven = {
			-- 	downloadSources = true,
			-- },
			-- referencesCodeLens = {
			-- 	enabled = true,
			-- },
			-- implementationsCodeLens = {
			-- 	enabled = true,
			-- },
			-- format = {
			-- 	enabled = true,
			-- },
			-- saveActions = {
			-- 	organizeImports = false,
			-- },
			-- contentProvider = {
			-- 	preferred = nil,
			-- },
			-- autobuild = {
			-- 	enabled = false,
			-- },
			-- references = {
			-- 	includeDecompiledSources = true,
			-- },
			-- signatureHelp = { enabled = true },
			-- completion = {
			-- 	favoriteStaticMembers = {
			-- 		"org.junit.Assert.*",
			-- 		"org.junit.Assume.*",
			-- 		"org.junit.jupiter.api.Assertions.*",
			-- 		"org.junit.jupiter.api.Assumptions.*",
			-- 		"org.junit.jupiter.api.DynamicContainer.*",
			-- 		"org.junit.jupiter.api.DynamicTest.*",
			-- 	},
			-- 	importOrder = {
			-- 		"java",
			-- 		"javax",
			-- 		"com",
			-- 		"org",
			-- 	},
			-- },
			-- sources = {
			-- 	organizeImports = {
			-- 		starThreshold = 9999,
			-- 		staticStarThreshold = 9999,
			-- 	},
			-- },
		},
	},

	on_attach = function(client, bufnr)
		-- require("jdtls").setup_dap()
		-- require("jdtls.setup").add_commands()
		--
		-- vim.keymap.set("n", "<leader>oi", function()
		-- 	jdtls.organize_imports()
		-- end, { desc = "organize imports" })
		--
		-- vim.keymap.set("n", "<leader>fm", function()
		-- 	jdtls.organize_imports()
		-- 	vim.lsp.buf.format()
		-- end, {
		-- 	desc = "organize all",
		-- })
		--
		-- vim.keymap.set("n", "<leader>gr", function()
		-- 	vim.lsp.buf.references()
		-- end, { desc = "" })
		--
		-- vim.keymap.set("n", "<leader>dl", function()
		-- 	vim.lsp.diagnostic.set_loclist()
		-- end, { desc = "" })
		--
		-- vim.keymap.set("v", "<leader>ev", function()
		-- 	jdtls.extract_variable(true)
		-- end, {
		-- 	desc = "java extract selected to variable",
		-- 	noremap = true,
		-- })
		-- vim.keymap.set("n", "<leader>ev", function()
		-- 	jdtls.extract_variable()
		-- end, {
		-- 	desc = "java extract variable",
		-- 	noremap = true,
		-- })
		-- --
		-- -- vim.keymap.set("v", "<leader>ev", function()
		-- -- 	jdtls.extract_variable_all(true)
		-- -- end, {
		-- -- 	desc = "java extract all selected to variable",
		-- -- 	noremap = true,
		-- -- })
		-- -- vim.keymap.set("n", "<leader>ev", function()
		-- -- 	jdtls.extract_variable_all()
		-- -- end, {
		-- -- 	desc = "java extract all to variable",
		-- -- 	noremap = true,
		-- -- })
		--
		-- vim.keymap.set("n", "<leader>ec", function()
		-- 	jdtls.extract_constant()
		-- end, {
		-- 	desc = "java extract constant",
		-- 	noremap = true,
		-- })
		-- vim.keymap.set("v", "<leader>ec", function()
		-- 	jdtls.extract_constant(true)
		-- end, {
		-- 	desc = "java extract selected to constant",
		-- 	noremap = true,
		-- })
		--
		-- vim.keymap.set("n", "<leader>em", function()
		-- 	jdtls.extract_method()
		-- end, {
		-- 	desc = "java extract method",
		-- 	noremap = true,
		-- })
		-- vim.keymap.set("v", "<leader>em", function()
		-- 	jdtls.extract_method(true)
		-- end, {
		-- 	desc = "java extract selected to method",
		-- 	noremap = true,
		-- })
		-- vim.keymap.set("n", "<leader>gt", function()
		-- 	local plugin = require("jdtls.tests")
		-- 	plugin.goto_subjects()
		-- end, {
		-- 	desc = "java open test",
		-- 	noremap = true,
		-- })
		-- vim.keymap.set("n", "<leader>ct", function()
		-- 	local plugin = require("jdtls.tests")
		-- 	plugin.generate()
		-- end, {
		-- 	desc = "java create test",
		-- 	noremap = true,
		-- })
		--
		-- vim.keymap.set("n", "<leader>ca", function()
  --     vim.lsp.buf.code_action()
		-- end, {
		-- 	desc = "java create test",
		-- 	noremap = true,
		-- })
		--
		-- vim.keymap.set("n", "<leader>qf", function()
  --     vim.diagnostic.setqflist()
		-- end, {
		-- 	desc = "",
		-- 	noremap = true,
		-- })

		-- vim.keymap.set("n", "<leader>jdm", function()
		-- 	jdtls.test_nearest_method()
		-- end, { desc = "java debug nearest test method" })
		-- vim.keymap.set("n", "<leader>jdc", function()
		-- 	jdtls.test_class()
		-- end, { desc = "java debug nearest test class" })
		--
		-- vim.cmd(
		-- 	[[ command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>) ]]
		-- )
		-- vim.cmd(
		-- 	[[ command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>) ]]
		-- )
		-- vim.cmd([[ command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config() ]])
		-- vim.cmd([[ command! -buffer JdtBytecode lua require('jdtls').javap() ]])
		-- vim.cmd([[ command! -buffer JdtJol lua require('jdtls').jol() ]])
		-- vim.cmd([[ command! -buffer JdtJshell lua require('jdtls').jshell() ]])

		-- lsp.on_attach(client, bufnr)
	end,

	-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

require("jdtls").start_or_attach(config)
