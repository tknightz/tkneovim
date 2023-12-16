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
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "luasnip",
      "autopairs",
    },
    event = { "InsertEnter", "CmdlineEnter" },
  },

  ["luasnip"] = {
    path = "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- Smart and powerful comment plugin for neovim
  ["comment"] = {
    path = "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    event = "BufRead",
  },

  -- Align code
  ["ezalign"] = {
    path = "echasnovski/mini.align",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.align").setup()
    end
  },

  -- Better playing with brackets
  ["nvim-surround"] = {
    path = "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        move_cursor = false,
      })
    end,
    event = "BufRead",
  },

  -- Auto close brackets
  ["autopairs"] = {
    path = "windwp/nvim-autopairs",
    event = "InsertEnter",
  },

  ["modes"] = {
    path = "mvllow/modes.nvim",
    event = "BufRead",
  },
}
