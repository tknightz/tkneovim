return {
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
    event = "User FilePost",
    opts = {
      sign = true,
      sign_priority = 102,
    },
  },

  -- Icons for some other stuffs
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        norg = {
          icon = "󱗃",
          color = "#ff557f",
          cterm_color = "65",
          name = "Orgmode",
        },
        http = {
          icon = "",
          color = "#ff557f",
          cterm_color = "65",
          name = "http",
        },
      },
    },
    module = "nvim-web-devicons",
  },

  -- Fastest color parser Neovim
  {
    "brenoprata10/nvim-highlight-colors",
    cmd = { "HighlightColors" },
    opts = {
      render = "virtual",
      virtual_symbol = "  ",
      enable_tailwind = true,
    },
  },

  -- Rich features buffer indicator
  {
    "akinsho/nvim-bufferline.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.bufferline")
    end,
    -- event = "User FilePost",
  },

  -- Fast status line
  {
    "nvim-lualine/lualine.nvim",
    event = "User FilePost",
    config = function()
      require("config.lualine")
    end,
  },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require("config.statuscol")
    end,
    event = "User FilePost",
  },
}
