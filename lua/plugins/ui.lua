return {
  {
    "tknightz/onedark.nvim",
    dir = "~/Repos/onedark.nvim",
    -- lazy = true,
    -- priority = 1000,
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

  -- Highlight comments
  {
    "folke/todo-comments.nvim",
    event = "User FilePost",
    opts = {
      sign = true,
      sign_priority = 102,
    },
  },

  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- Icons for some other stuffs
  -- {
  --   "nvim-tree/nvim-web-devicons",
  --   opts = {
  --     override = {
  --       norg = {
  --         icon = "󱗃",
  --         color = "#ff557f",
  --         cterm_color = "65",
  --         name = "Orgmode",
  --       },
  --       http = {
  --         icon = "",
  --         color = "#ff557f",
  --         cterm_color = "65",
  --         name = "http",
  --       },
  --     },
  --   },
  --   module = "nvim-web-devicons",
  -- },

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
    event = "User FilePost",
    config = function(_, opts)
      require("config.bufferline")
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
