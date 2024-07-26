require("neo-tree").setup({
  close_if_last_window = true,
  default_component_configs = {
    git_status = {
      symbols = {
        untracked = "?",
      },
    },
  },
  source_selector = {
    winbar = true,
    statusline = true,
  },
  popup_border_style = "rounded",
  window = {
    -- position = "right",
    width = 35,
    mappings = {
      ["<space>"] = "none",
      ["w"] = "open_with_window_picker",
    },
  },
  filesystem = {
    find_by_full_path_words = true,
    follow_current_file = {
      enabled = false,
      leave_dirs_open = true,
    },
    use_libuv_file_watcher = true,
    bind_to_cwd = false,
    cwd_target = {
      sidebar = "none",
    },
    git_status = {
      windnow = {
        mappings = {
          ["A"]  = "git_add_all",
          ["s"]  = "git_stage_file",
          ["u"] = "git_unstage_file",
          ["X"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
          ["oc"] = { "order_by_created", nowait = false },
          ["od"] = { "order_by_diagnostics", nowait = false },
          ["om"] = { "order_by_modified", nowait = false },
          ["on"] = { "order_by_name", nowait = false },
          ["os"] = { "order_by_size", nowait = false },
          ["ot"] = { "order_by_type", nowait = false },
        }
      }
    }
  },
})

-- vim.cmd("hi NeoTreeNormal guibg=#11171E")
-- vim.cmd("hi NeoTreeNormalNC guibg=#11171E")
vim.cmd("hi NeoTreeTitleBar guibg=NONE guifg=white")
vim.cmd("hi NeoTreeGitUnstaged gui=NONE guifg=#e55561")
