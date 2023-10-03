local M = {}

-- In order to disable a default keymap, use
M.disabled = {
	n = {
		-- ["<leader>h"] = "",
		-- ["<C-a>"] = "",
	},
}

-- Your custom mappings
M.abc = {
	n = {
		-- ["<C-n>"] = { "<cmd> Telescope <CR>", "Telescope" },
		-- ["<C-s>"] = { ":Telescope Files <CR>", "Telescope Files" },
		-- ["<C-h>"] = { "<A-h>", "Lena: Toggle terminal" },
		["<C-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"Toggle horizontal term",
		},

		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({
					async = false,
				})

				vim.lsp.buf.execute_command({
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				})
			end,
			"Format and organize",
		},
	},

	i = {
		-- ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		-- ...
		-- ["<M-Left>"] = { "<S-Left>", "" },
		-- ["<M-Right>"] = { "<S-Right>", "" },
	},

	t = {
		["<C-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"Toggle horizontal term",
		},
	},
}

return M
