
-- ****************************************
-- *          Treesitter Modules          *
-- ****************************************
-- 
-- I use several treesitter stuffs


return {
  ["treesitter"] = {
    path = "nvim-treesitter/nvim-treesitter",
    -- commit = "575f5a4b1fcb60c1ac4f560c46a5171454d674ca",
    -- commit = "3af1220e18034eb2ce7d1c8e77055bc3bf3c1c36",
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      { "nvim-treesitter/playground",  cmd = "TSPlaygroundToggle"},
      "HiPhish/nvim-ts-rainbow2",
      { "yioneko/nvim-yati", version = "*" },
    }
  }
}
