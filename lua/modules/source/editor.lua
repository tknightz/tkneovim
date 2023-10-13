return {
  -- Providing completion out of the box
  ["cmp"] = {
    path = "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-cmdline",
      "autopairs",
    },
    event = { "InsertEnter", "CmdlineEnter" },
  },

  ["luasnip"] = {
    path = "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
  },

  -- Smart and powerful comment plugin for neovim
  ["comment"] = {
    path = "numToStr/Comment.nvim",
    event = "BufRead",
  },

  -- Align code
  ["ezalign"] = {
    path = "junegunn/vim-easy-align",
    cmd = "EasyAlign"
  },

  -- Better playing with brackets
  ["nvim-surround"] = {
    path = "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup {
        move_cursor = false,
      }
    end,
    event = "BufRead"
  },

  -- Auto close brackets
  ["autopairs"] = {
    path = "windwp/nvim-autopairs",
    event = "InsertEnter"
  },

  ["modes"] = {
    path = "mvllow/modes.nvim",
    event = "BufRead",
  },
}
