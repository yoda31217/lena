local treesitter_config = require "plugins.configs.treesitter"
treesitter_config.ensure_installed =
  { "vim", "lua", "html", "css", "javascript", "typescript", "tsx", "json", "java", "c", "zig" }
treesitter_config.incremental_selection =
  { enable = true, keymaps = { node_incremental = "v", node_decremental = "V" } }

local plugins = {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "eslint-lsp",
        "prettier",
        "stylua",
        "typescript-language-server",
      },
    },
  },
}

return plugins
