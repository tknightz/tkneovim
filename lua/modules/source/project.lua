return {

  -- Git inside Vim
  ["fugitive"] = {
    path = "tpope/vim-fugitive",
    cmd = {"Git"},
  },

  -- Single tabpage interface for easily cycling through diffs for all modified
  -- files for any git rev.
  ["diffview"] = {
    path = "sindrets/diffview.nvim",
    cmd = {"DiffviewOpen", "DiffviewToggleFiles"},
  },

  -- Git integration for buffers
  ["gitsigns"] = {
    path = "lewis6991/gitsigns.nvim",
    event = "BufRead",
  },

  -- Projects management and navigation
  ["project_nvim"] = {
    path = "ahmedkhalf/project.nvim",
    module_pattern = {"projects", "telescope._extensions.projects"},
    config = function()
      require("project_nvim").setup{ }
    end,
    cmd = {"ProjectRoot"}
  }
}
