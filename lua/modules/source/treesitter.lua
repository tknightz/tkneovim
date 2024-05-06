-- ****************************************
-- *          Treesitter Modules          *
-- ****************************************
--
-- I use several treesitter stuffs

return {
  ["treesitter"] = {
    path = "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = false })
      ts_update()
    end,

    dependencies = {
      "gungun974/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
      { "yioneko/nvim-yati", version = "*" },
    },
  },

  ["context"] = {
    path = "nvim-treesitter/nvim-treesitter-context",
    cmd = { "TSContextToggle", "TSContextEnable" },
    config = function()
      require("treesitter-context").setup({})
    end,
  },
}
