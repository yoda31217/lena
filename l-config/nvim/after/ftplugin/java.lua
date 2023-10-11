local jdtls = require("jdtls")
local utils = require("core.utils")

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
    "-data " .. vim.fn.stdpath("data") .. "/mason/packages/jdtls/lena_data",
  },
  root_dir = vim.fn.getcwd(),

  settings = { java = {} },

  on_attach = function(client, buffer)
    utils.load_mappings("lspconfig", { buffer = buffer })

    vim.keymap.set("n", "<leader>fm", function()
      vim.lsp.buf.format({ async = false })
      jdtls.organize_imports()
    end, { noremap = true, desc = "Organize Imports" })

    vim.keymap.set("n", "<C-S-v>", function()
      jdtls.extract_variable()
    end, { noremap = true, desc = "Extract variable" })

    vim.keymap.set("n", "<F5>", function()
      print("clk")
      -- vim.cmd("term ")
    end, { noremap = true, desc = "" })

    jdtls.setup_dap({})
    -- client.server_capabilities.semanticTokensProvider = nil
  end,

  init_options = { bundles = { vim.fn.glob("~/.config/nvim/java-debug/com.microsoft.java.debug.plugin-*.jar", 1) } },
}

jdtls.start_or_attach(config)
