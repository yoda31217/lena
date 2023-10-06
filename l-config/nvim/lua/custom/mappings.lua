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
		-- ["<C-A-h>"] = {
		-- 	function()
		-- 		require("nvterm.terminal").toggle("horizontal")
		-- 	end,
		-- 	"Toggle horizontal term",
		-- },
		--
		-- ["<leader>fm"] = {
		-- 	function()
		-- 		vim.lsp.buf.format({
		-- 			async = false,
		-- 		})
		--
		-- 		vim.lsp.buf.execute_command({
		-- 			command = "_typescript.organizeImports",
		-- 			arguments = { vim.api.nvim_buf_get_name(0) },
		-- 		})
		-- 	end,
		-- 	"Format and organize",
		-- },
		-- ["gd"] = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "" },
		-- ["K"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "" },
		-- ["rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "" },
		-- ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "" },
		-- ["<leader>ld"] = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "" },
		-- ["[d"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "" },
		-- ["]d"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "" },
		-- ["<leader>q"] = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "" },



-- My hotkeys
		["<leader>tw"] = { "<CMD>lua vim.o.wrap = not vim.o.wrap<CR>", "" },
	},

	i = {
		-- ["<C-M-h>"] = {
		-- 	function()
		-- 		require("nvterm.terminal").toggle("horizontal")
		-- 	end,
		-- 	"Toggle horizontal term",
		-- },

		-- ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		-- ...
		-- ["<M-Left>"] = { "<S-Left>", "" },
		-- ["<M-Right>"] = { "<S-Right>", "" },
	},

	t = {
		-- ["<C-M-h>"] = {
		-- 	function()
		-- 		require("nvterm.terminal").toggle("horizontal")
		-- 	end,
		-- 	"Toggle horizontal term",
		-- },
	},
}

return M
