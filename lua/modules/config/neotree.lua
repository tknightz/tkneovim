require("neo-tree").setup({
  default_component_configs = {
    git_status = {
      symbols = {
        untracked = "כֿ"
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
