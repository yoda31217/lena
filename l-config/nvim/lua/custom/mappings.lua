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
    ["<leader>fi"] = {
      function()
        require("telescope.builtin").live_grep({
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",

            "--follow",
            "--no-ignore",
          },
        })
      end,
      "Live grep with no ignore",
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
