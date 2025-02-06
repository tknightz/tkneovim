return {
  -- Completion plugin
  {
    "saghen/blink.cmp",
    -- lazy = false, -- lazy loading handled internally
    event = "User FilePost",
    -- optional: provides snippets for the snippet source
    dependencies = { "L3MON4D3/LuaSnip" },
    -- version = "v0.*",

    -- use a release tag to download pre-built binaries
    -- version = "v0.*",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = "cargo build --release",

    config = function()
      require("config.blink")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    version = "v2.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    build = "make install_jsregexp",
    config = function()
      require("config.luasnip")
    end,
  },

  -- Comment your code with treesitter
  {
    "folke/ts-comments.nvim",
    event = "User FilePost",
    opts = {},
  },

  {
    "abecodes/tabout.nvim",
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    opts = {},
    priority = 1000,
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
      require("config.autopairs")
    end,
  },

  -- Move your cursor like a boss
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

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "User FilePost",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      vim.keymap.set({ "n", "i" }, "<C-d>", function()
        mc.matchAddCursor(1)
      end)
      vim.keymap.set({ "n", "i" }, "<C-k>", function()
        mc.matchSkipCursor(1)
      end)

      vim.keymap.set("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        elseif mc.hasCursors() then
          mc.clearCursors()
        else
          -- Default <esc> handler.
        end
      end)
    end,
  },
}
