return {
  -- Colorscheme here
  -- set colorname to automate set colorscheme
  ["theme"] = {
    -- path = "tknightz/onedark.nvim",
    dir = "~/Repos/onedark.nvim",
    colorname = "onedark",
    priority = 1000,
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
  ["highlight-colors"] = {
    path = "brenoprata10/nvim-highlight-colors",
    cmd = { "HighlightColors" },
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },

  -- Rich features buffer indicator
  ["bufferline"] = {
    path = "akinsho/nvim-bufferline.lua",
    dependencies = { "devicons" },
  },

  -- Fast status line
  ["lualine"] = {
    path = "nvim-lualine/lualine.nvim",
    event = { "BufNewFile", "BufRead" },
  },
}
