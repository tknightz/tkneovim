
-- ****************************************
-- *          Treesitter Modules          *
-- ****************************************
-- 
-- I use several treesitter stuffs


return {
  ["treesitter"] = {
    path = "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,

    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
      { "nvim-treesitter/playground",  cmd = "TSPlaygroundToggle" },
      { "yioneko/nvim-yati", version = "*" },
    }
  }
}
