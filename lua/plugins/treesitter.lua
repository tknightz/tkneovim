return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "User FilePost", "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
      -- copy from lazynvim
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = false })
      ts_update()
    end,
    config = function()
      require("config.treesitter")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "User FilePost",
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    event = "User FilePost",
    opts = {
      keymaps = {
        useDefaults = true
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "User FilePost" },
    config = function()
      require("treesitter-context").setup({
        max_lines = 3,
        multiline_threshold = 1,
        separator = "─",
        min_window_height = 20,
      })
    end,
  },
}
