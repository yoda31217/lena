---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyonight",

  telescope = {
    style = "bordered",
  },

  nvdash = {
    load_on_startup = true,
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

vim.opt.wrap = false

return M
