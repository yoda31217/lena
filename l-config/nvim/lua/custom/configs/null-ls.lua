-- custom/configs/null-ls.lua

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier.with({ extra_args = { "--single-quote", "--print-width", "120" } }),
  formatting.stylua,

  -- lint.shellcheck,
  lint.eslint_d,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
