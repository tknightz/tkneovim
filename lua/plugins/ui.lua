return {
  {
    -- "tknightz/onedark.nvim",
    dir = "~/Repos/onedark.nvim",
    -- lazy = true,
    priority = 900,
    config = function()
      require("onedark").setup({
        style = "dark",
        transparent = true,
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

  -- Icons for files
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
        [".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        [".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
        [".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
        [".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
        ["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["eslint.config.mjs"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
        ["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
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

  -- Statuscol
  {
    "tknightz/statuscol.nvim",
    config = function()
      require("config.statuscol")
    end,
    event = "User FilePost",
  },
}
