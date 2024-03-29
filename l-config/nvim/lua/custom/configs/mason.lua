local mason_config = require("plugins.configs.mason")

mason_config.ensure_installed = {
  "lua-language-server",
  "html-lsp",
  "eslint-lsp",
  "prettier",
  "stylua",
  "typescript-language-server",
  "jdtls",
  "java-test",
  "java-debug-adapter",
  "pyright",
  "mypy",
  "ruff",
  "black",
}
