local configs = require("plugins.configs.lspconfig")
local utils = require("core.utils")
local telescope = require("telescope")

---@diagnostic disable-next-line: different-requires
local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "clangd" }

local on_attach = configs.on_attach
local capabilities = configs.capabilities

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

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

    require("refactoring").setup({})

    telescope.load_extension("refactoring")

    vim.keymap.set({ "n", "x" }, "<C-S-r>", function()
      telescope.extensions.refactoring.refactors()
    end)

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

require("lsp-file-operations").setup()

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
