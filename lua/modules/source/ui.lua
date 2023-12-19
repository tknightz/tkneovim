return {
  -- Colorscheme here
  -- set colorname to automate set colorscheme
  ["theme"] = {
    path = "tknightz/onedark.nvim",
    colorname = "onedark",
    priority = 50,
  },

  -- Show dashboard first come
  ["dashboard"] = {
    path = "glepnir/dashboard-nvim",
  },

  -- Highlight comments
  ["todocomment"] = {
    path = "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup({
        sign = true,
        sign_priority = 102,
      })
    end,
  },

  -- Icons for some other stuffs
  ["devicons"] = {
    path = "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
  },

  -- Fastest color parser Neovim
  ["colorizer"] = {
    path = "norcalli/nvim-colorizer.lua",
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
  },

  -- Rich features buffer indicator
  ["bufferline"] = {
    path = "akinsho/nvim-bufferline.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
  },

  -- Fast status line
  ["lualine"] = {
    path = "nvim-lualine/lualine.nvim",
    event = { "BufNewFile", "BufRead" },
  },
}
