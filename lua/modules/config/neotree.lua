require("neo-tree").setup({
  close_if_last_window = true,
  follow_current_file = true,
  use_libuv_file_watcher = true,
  default_component_configs = {
    git_status = {
      symbols = {
        untracked = "?",
        unstaged = "",
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
      ["<space>"] = "none"
    }
  },
  filesystem = {
    find_by_full_path_words = true,
  },
})

vim.cmd("hi NeoTreeNormal guibg=#0a0e10")
vim.cmd("hi NeoTreeNormalNC guibg=#0a0e10")
vim.cmd("hi NeoTreeTitleBar guibg=NONE guifg=white")
vim.cmd("hi NeoTreeGitUntracked guibg=NONE guifg=#e95678")
vim.cmd("hi NeoTreeGitUnstaged guibg=NONE")
