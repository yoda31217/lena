local M = {}

M.disabled = {
	n = {},
}

M.abc = {
	n = {
		["<leader>tb"] = { "<Cmd> Telescope builtin<CR>", "Lists of Built-in Telescope pickers" },
		["<leader>tw"] = { "<CMD>lua vim.o.wrap = not vim.o.wrap<CR>", "Toggle word wrapping in the current buffer" },
	},

	i = {},

	t = {},
}

return M
