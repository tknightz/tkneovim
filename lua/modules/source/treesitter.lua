
-- ****************************************
-- *          Treesitter Modules          *
-- ****************************************
-- 
-- I use several treesitter stuffs


return {
  ["treesitter"] = {
    path = "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      { "nvim-treesitter/playground",  cmd = "TSPlaygroundToggle" },
      { "yioneko/nvim-yati", version = "*" },
    }
  }
}
