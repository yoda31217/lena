local M = {}

M.disabled = {
	n = {},
}

M.abc = {
	n = {
		["<leader>tb"] = { "<CMD> Telescope builtin<CR>", "Lists of Built-in Telescope pickers" },
		["<leader>tw"] = { "<CMD>lua vim.o.wrap = not vim.o.wrap<CR>", "Toggle word wrapping in the current buffer" },
		["<CR>"] = { "a<CR><ESC>", "Append New Line in Normal mode" },
	},

	i = {},

	t = {},
}

return M
