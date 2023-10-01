local nvimtree_config = require("plugins.configs.nvimtree")

nvimtree_config.renderer.icons.show.git = true
nvimtree_config.renderer.icons.modified_placement = "before"
nvimtree_config.renderer.root_folder_label = ":t"
nvimtree_config.renderer.highlight_git = true
nvimtree_config.renderer.highlight_opened_files = "none"
nvimtree_config.renderer.highlight_modified = "all"
nvimtree_config.modified = { enable = true }
nvimtree_config.git.enable = true
nvimtree_config.git.ignore = false
