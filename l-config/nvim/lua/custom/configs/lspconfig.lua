local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local utils = require("core.utils")

---@diagnostic disable-next-line: different-requires
local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.tsserver.setup({

  on_attach = function(client, buffer)
    utils.load_mappings("lspconfig", { buffer = buffer })

    vim.keymap.set("n", "<leader>fm", function()
      vim.lsp.buf.format({ async = false })
      vim.lsp.buf.execute_command({
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
      })
    end, { noremap = true, desc = "Format code" })

    on_attach(client, buffer)
  end,

  capabilities = capabilities,
  -- commands = {
  --   OrganizeImports = {
  --     ts_organize_imports,
  --     description = "Organize Imports",
  --   },
  -- },
})

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
