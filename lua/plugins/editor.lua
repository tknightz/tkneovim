return {
  -- Providing completion out of the box
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "L3MON4D3/LuaSnip",
      "windwp/nvim-autopairs",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require("config.cmp")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    -- event = "InsertEnter",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("config.luasnip")
    end,
  },

  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Better playing with brackets
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        move_cursor = false,
      })

      local v_chars = { "(", ")", "[", "]", "{", "}", "'", '"' }
      for _, char in pairs(v_chars) do
        vim.keymap.set("v", char, "<Plug>(nvim-surround-visual)" .. char)
      end
    end,
    event = "BufRead",
  },

  -- Auto close brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      npairs.setup({
        disable_filetype = { "TelescopePrompt" },
      })

      npairs.add_rules({
        Rule('"""$', '"""', "lua"):use_regex(true),
      })

      npairs.add_rules({
        Rule("then", "end", "lua"):end_wise(function(opts)
          -- Add any context checks here, e.g. line starts with "if"
          return string.match(opts.line, "^%s*if") ~= nil
        end),
      })
    end,
  },

  {
    "mvllow/modes.nvim",
    event = "BufRead",
    opts = {
      colors = {
        copy = "#5a2971",
        delete = "#7a3841",
        insert = "#182826",
        visual = "#2f3d5b",
      },

      -- Cursorline highlight opacity
      line_opacity = 0.6,

      -- Highlight cursor
      set_cursor = true,

      -- or ignored filetypes
      set_cursorline = true,

      -- Enable line number highlights to match cursorline
      -- set_number = true,
    },
  },

  {
    "folke/flash.nvim",
    config = function()
      require("flash").setup()
    end,
    keys = {
      {
        "gz",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "gZ",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
