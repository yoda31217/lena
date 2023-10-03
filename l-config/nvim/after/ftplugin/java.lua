-- require("core.bootstrap").echo("asdasdasd" .. "123123")

local config = {
	cmd = { "/Users/niknik/.local/share/nvim/mason/packages/jdtls/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

require("jdtls").start_or_attach(config)
