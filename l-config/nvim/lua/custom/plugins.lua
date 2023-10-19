require("custom.configs.treesitter")
require("custom.configs.nvimtree")
require("custom.configs.blankline")
require("custom.configs.mason")
require("custom.configs.gitsigns")
require("custom.configs.telescope")

local plugins = {
  -- Skeleton of this plugin configuration copy-pasted from NvChad
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("custom.configs.null-ls")
        end,
      },
      {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-neo-tree/neo-tree.nvim",
        },
      },
    },

    init = function()
      require("core.utils").lazy_load("nvim-lspconfig")
    end,

    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
  },

  {
    "mfussenegger/nvim-dap",
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "ThePrimeagen/vim-be-good",
    lazy = false,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = false,
    dependencies = { "numToStr/Comment.nvim" },
    config = function()
      require("ts_context_commentstring").setup({})
      -- Re-Setup 'Comment' plugin here
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
}

return plugins
