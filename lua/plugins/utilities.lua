return {
  -- Fuzzy search all the stuffs
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      -- { "nvim-lua/popup.nvim", module = "popup" },
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "tknightz/telescope-termfinder.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },

    module = "telescope",
    cmd = "Telescope",
    config = function()
      require("config.telescope")
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Neotree" },
    config = function()
      require("config.neotree")
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "User FilePost",
    config = function()
      require("config.ufo")
    end,
  },

  -- Highlight cursor word
  {
    "RRethy/vim-illuminate",
    event = "User FilePost",
    config = function()
      local special_fts = require("lib.consts").special_fts
      require("illuminate").configure({
        filetypes_denylist = special_fts,
        modes_denylist = { "i" },
        large_file_cutoff = 2000,
      })
    end,
  },

  -- Better buffer delete
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
  },

  -- Quickly jump between windows
  {
    "s1n7ax/nvim-window-picker",
    module = "window-picker",
    lazy = true,
    version = "v2.*",
    config = function()
      require("window-picker").setup({
        show_prompt = false,
        hint = "floating-big-letter",
        filter_rules = {
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = {},
          },
        },
      })
    end,
  },

  -- Indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "User FilePost",
    config = function()
      local special_fts = require("lib.consts").special_fts

      require("ibl").setup({
        indent = {
          char = "│",
        },
        scope = { enabled = true },
        exclude = {
          filetypes = special_fts,
        },
      })
    end,
  },

  -- Even better % navigate and highlight matching words
  {
    "andymass/vim-matchup",
    event = "User FilePost",
    init = function()
      local vim = vim

      vim.g.matchup_matchparen_offscreen = {}
      vim.g.matchup_matchparen_timeout = 300
      vim.g.matchup_matchparen_insert_timeout = 60

      vim.g.matchup_matchparen_nomode = "i"
      vim.g.matchup_motion_enabled = 1
      vim.g.matchup_text_obj_enabled = 1
    end,
  },

  -- Better search
  {
    "asiryk/auto-hlsearch.nvim",
    version = "1.1.0",
    config = function()
      require("auto-hlsearch").setup({
        remap_keys = { "/", "?", "*", "!", "#", "n", "N" },
        create_commands = true,
      })
    end,
    keys = { "/", "?", "*", "#" },
  },

  -- Nice looking notifications with animation
  {
    "rcarriga/nvim-notify",
    module = "notify",
    config = function()
      require("config.notify")
    end,
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "User FilePost",
    opts = {},
  },

  -- Organize keymaps
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<Space>", "z=", { "<leader>", mode = "v" } },
    event = "VeryLazy",
    config = function()
      require("config.whichkey")
    end,
  },

  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require("bqf").setup({
        preview = {
          winblend = 10,
        },
        func_map = {
          pscrollup = "<C-d>",
        },
      })
    end,
    ft = "qf",
  },

  {
    "stevearc/quicker.nvim",
    opts = {},
    event = "User FilePost",
  },

  -- A plugin to visualise and resolve merge conflicts in neovim
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },

  -- Jump to last edit
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup({})
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    config = function()
      require("toggleterm").setup({
        highlights = {
          StatusLine = { link = "StatusLine" },
          StatusLineNC = { link = "StatusLineNC" },
        },
      })
    end,
  },

  -- {
  --   "m-demare/hlargs.nvim",
  --   opts = {},
  --   event = "User FilePost",
  -- },

  {
    "Wansmer/treesj",
    cmd = { "TSJToggle" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },

  {
    "LudoPinelli/comment-box.nvim",
    cmd = { "CBlcline", "CBlcbox" },
    opts = {},
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "User FilePost",
    config = function()
      -- This module contains a number of default definitions
      require("rainbow-delimiters.setup").setup({
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterViolet",
          "RainbowDelimiterOrange",
          "RainbowDelimiterRed",
          "RainbowDelimiterCyan",
          "RainbowDelimiterGreen",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
        },
        blacklist = { "markdown" },
      })
    end,
  },

  {
    "lukas-reineke/headlines.nvim",
    ft = { "org", "norg", "markdown" },
    config = true,
  },

  {
    "folke/edgy.nvim",
    event = "BufEnter",
    config = function()
      require("config.edgy")
    end,
  },

  {
    "utilyre/barbecue.nvim",
    version = "*",
    event = "User FilePost",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      local theme = require("onedark.barbecue")
      require("barbecue").setup({
        theme = theme,
      })
    end,
  },

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-k>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-l>",
        },
      })
    end,
    cmd = { "SupermavenUseFree", "SupermavenStart" },
  },

  {
    "abecodes/tabout.nvim",
    lazy = true,
    -- event = "InsertCharPre",
    opts = {},
  },

  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    config = function()
      require("kulala").setup({
        default_view = "body",
        default_env = "dev",
        debug = false,
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  {
    "MagicDuck/grug-far.nvim",
    opts = {},
    cmd = { "GrugFar" },
  },

  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    opts = {
      retirementAgeMins = 10,
      ignoredFiletypes = require("lib.consts").special_fts,
    },
    event = "User FilePost",
  },

  {
    "gbprod/yanky.nvim",
    opts = {
      system_clipboard = {
        sync_with_ring = false,
      },
    },
    keys = {
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "y", '"+y', mode = { "v", "x" }, desc = "Yank text visual" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
    event = "User FilePost",
  },

  {
    "nacro90/numb.nvim",
    opts = {},
    event = "User FilePost",
  },
}
