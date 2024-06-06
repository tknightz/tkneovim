return {
  -- Colorscheme here
  -- set colorname to automate set colorscheme
  {
    "tknightz/onedark.nvim",
    dir = "~/Repos/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark",
        transparent = false,
        code_style = {
          keywords = "italic,bold",
          functions = "bold",
        },

        plugins = {},
      })

      vim.cmd("colorscheme onedark")
    end,
  },

  -- Show dashboard first come
  {
    "glepnir/dashboard-nvim",
    config = function()
      require("config.dashboard")
    end,
  },

  -- Highlight comments
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    opts = {
      sign = true,
      sign_priority = 102,
    },
  },

  -- Icons for some other stuffs
  {
    "kyazdani42/nvim-web-devicons",
    opts = {},
    module = "nvim-web-devicons",
  },

  -- Fastest color parser Neovim
  {
    "brenoprata10/nvim-highlight-colors",
    cmd = { "HighlightColors" },
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },

  -- Rich features buffer indicator
  {
    "akinsho/nvim-bufferline.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("config.bufferline")
    end,
  },

  -- Fast status line
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufNewFile", "BufRead" },
    config = function()
      require("config.lualine")
    end,
  },
}
