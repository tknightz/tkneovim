return {
  -- Providing completion out of the box
  -- {
  --   "iguanacucumber/magazine.nvim",
  --   name = "nvim-cmp",
  --   dependencies = {
  --     { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
  --     { "iguanacucumber/mag-buffer", name = "cmp-buffer" },
  --     { "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
  --     { "FelipeLema/cmp-async-path", url = "https://codeberg.org/FelipeLema/cmp-async-path" },
  --     "saadparwaiz1/cmp_luasnip",
  --     "hrsh7th/cmp-nvim-lsp-signature-help",
  --   },
  --   event = { "InsertEnter", "CmdlineEnter" },
  --   config = function()
  --     require("config.cmp")
  --   end,
  -- },
  --
  -- {
  --   "abecodes/tabout.nvim",
  --   lazy = true,
  --   -- event = "InsertCharPre",
  --   opts = {},
  -- },

  {
    "saghen/blink.cmp",
    -- lazy = false, -- lazy loading handled internally
    event = "User FilePost",
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",

    -- use a release tag to download pre-built binaries
    -- version = "v0.*",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = "cargo build --release",

    config = function ()
      require("config.blink")
    end
  },

  -- {
  --   "L3MON4D3/LuaSnip",
  --   lazy = true,
  --   version = "v2.*",
  --   build = "make install_jsregexp",
  --   dependencies = {
  --     "rafamadriz/friendly-snippets",
  --   },
  --   config = function()
  --     require("config.luasnip")
  --   end,
  -- },

  {
    "folke/ts-comments.nvim",
    event = "User FilePost",
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
    event = "User FilePost",
  },

  -- Auto close brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    -- lazy = true,
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
