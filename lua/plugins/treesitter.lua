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
    event = "User FilePost",
  },

  -- {
  --   "yioneko/nvim-yati",
  --   version = "*",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     {
  --       "yioneko/vim-tmindent",
  --       opts = {
  --         enabled = function() return true end,
  --         use_treesitter = function() return true end,
  --       },
  --     },
  --   },
  --   event = "User FilePost",
  -- },

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
