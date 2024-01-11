-- custom/configs/null-ls.lua

local null_ls = require("null-ls")

local sources = {
  -- python
  -- null_ls.builtins.diagnostics.mypy.with({
  --   extra_args = {
  --     "--python-executable",
  --     "/Users/nikita/Documents/projects/uniqantiq-hardware-supply/amazon-extension/projects/analytics/a7s-dash/.venv/bin/python3",
  --   },
  -- }),
  -- null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.ruff,
  -- null_ls.builtins.formatting.ruff,
  -- migrate to ruff or blackd
  null_ls.builtins.formatting.black,

  -- lua
  null_ls.builtins.formatting.stylua,

  -- ts/js/tsx/jsx
  null_ls.builtins.formatting.prettier.with({ extra_args = { "--single-quote", "--print-width", "120" } }),
  null_ls.builtins.diagnostics.eslint_d,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
