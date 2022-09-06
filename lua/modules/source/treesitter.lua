
-- ****************************************
-- *          Treesitter Modules          *
-- ****************************************
-- 
-- I use several treesitter stuffs


return {
  ["treesitter"] = {
    path = "nvim-treesitter/nvim-treesitter",
    after = "theme"
  },

  ["treesitter-textobjects"] = {
    path = "nvim-treesitter/nvim-treesitter-textobjects",
    after = "treesitter"
  },

  ["treesitter-playground"] = {
    path = "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },

  ["treesitter-rainbow"] = {
    path = "p00f/nvim-ts-rainbow",
    after = "treesitter"
  },

  ["treesitter-context"] = {
    path = "nvim-treesitter/nvim-treesitter-context",
    cmd = {"TSContextEnable", "TSContextToggle"},
  },

  ["hlargs"] = {
    path = "m-demare/hlargs.nvim",
    after = "treesitter",
    config = function()
      require('hlargs').setup({
        color = "#f34b7d"
      })
    end
  }
}
