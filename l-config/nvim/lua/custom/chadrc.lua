---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "monekai",

	telescope = {
		style = "bordered",
	},

	nvdash = {
		load_on_startup = true,
	},
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

vim.opt.wrap = false
vim.opt.colorcolumn = "80,120"

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--   -- pattern = {"*.c", "*.h"},
--   callback = function(ev)
--     print(string.format('event fired: %s, %s.', ev.event, ev.file))
--   end
-- })

return M
