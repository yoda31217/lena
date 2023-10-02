local blankline_config = require("plugins.configs.others").blankline

vim.opt.list = true
vim.opt.listchars:append("space:•")
vim.opt.listchars:append("eol:󱞣")

blankline_config.show_end_of_line = true
blankline_config.space_char_blankline = " "

