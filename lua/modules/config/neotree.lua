require("neo-tree").setup({
  close_if_last_window = true,
  default_component_configs = {
    git_status = {
      symbols = {
        untracked = "?",
      }
    }
  },
  source_selector = {
    winbar = true,
    statusline = true
  },
  popup_border_style = "rounded",
  window = {
    width = 35,
    mappings = {
      ["<space>"] = "none",
      ["w"] = "open_with_window_picker",
    }
  },
  filesystem = {
    find_by_full_path_words = true,
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    use_libuv_file_watcher = true,
    bind_to_cwd = false,
    cwd_target = {
      sidebar = "none"
    }
  },
})

-- vim.cmd("hi NeoTreeNormal guibg=#0a0e10")
-- vim.cmd("hi NeoTreeNormalNC guibg=#0a0e10")
vim.cmd("hi NeoTreeTitleBar guibg=NONE guifg=white")
vim.cmd("hi NeoTreeGitUnstaged gui=NONE guifg=#e55561")
