local nvim_tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback
nvim_tree.setup({
  hijack_cursor = true,
  update_cwd = false,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },

  renderer = {
    highlight_git = true,
    root_folder_modifier = ":t",
    icons = {
      padding = "  ",
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },

  view = {
    width = 30,
    mappings = {
      custom_only = false,
      list = {
        { key = "e", cb = tree_cb("cd") },
      },
    },
  },

  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
})
