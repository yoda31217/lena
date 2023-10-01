local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

---@diagnostic disable-next-line: different-requires
local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- local function ts_organize_imports()
--   local params = {
--     command = "_typescript.organizeImports",
--     arguments = { vim.api.nvim_buf_get_name(0) },
--   }
--   vim.lsp.buf.execute_command(params)
-- end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- commands = {
  --   OrganizeImports = {
  --     ts_organize_imports,
  --     description = "Organize Imports",
  --   },
  -- },
}

-- Without the loop, you would have to manually set up each LSP
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
