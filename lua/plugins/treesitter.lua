return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    -- event = { "BufRead" },
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
    event = { "BufReadPost" },
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    event = "User FilePost",
    opts = { useDefaultKeymaps = true },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    cmd = { "TSContextToggle", "TSContextEnable" },
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
