
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
}
