return {

  -- Git inside Vim
  ["fugitive"] = {
    path = "tpope/vim-fugitive",
    cmd = { "Git" },
  },

  -- Single tabpage interface for easily cycling through diffs for all modified
  -- files for any git rev.
  ["diffview"] = {
    path = "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewToggleFiles", "DiffviewFileHistory" },
  },

  -- Git integration for buffers
  ["gitsigns"] = {
    path = "lewis6991/gitsigns.nvim",
    event = "BufRead",
  },

  -- Projects management and navigation
  ["project_nvim"] = {
    path = "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        patterns = { ".git" },
        detection_methods = { "pattern" },
      })
    end,
  },

  ["scope"] = {
    path = "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  },
}
