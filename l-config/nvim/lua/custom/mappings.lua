local M = {}

M.disabled = {
  n = {},
}

M.abc = {
  n = {
    ["<C-S-l>"] = { "<CMD>LspRestart<CR>", "Restart LSP" },
    ["<C-S-t>"] = { "<CMD> Telescope builtin<CR>", "Lists of Built-in Telescope pickers" },
    ["<C-S-w>"] = { "<CMD>lua vim.o.wrap = not vim.o.wrap<CR>", "Toggle word wrapping in the current buffer" },
    -- ["<CR>"] = { "a<CR><ESC><RIGHT>", "Append New Line in Normal mode" },
    ["<C-S-h>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "Toggle horizontal term",
    },
  },

  i = {},

  t = {
    ["<C-S-h>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "Toggle horizontal term",
    },
  },
}

return M
