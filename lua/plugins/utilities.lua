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
      "kyazdani42/nvim-web-devicons",
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
    event = "BufRead",
    config = function()
      require("config.ufo")
    end,
  },

  -- Highlight cursor word
  {
    "RRethy/vim-illuminate",
    event = "BufRead",
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
    event = "BufRead",
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
    event = "BufRead",
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
    event = "BufRead",
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
    dependencies = { "ashfinal/qfview.nvim" },
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

  -- pretty quickfix UI
  {
    "ashfinal/qfview.nvim",
    lazy = true,
    config = true,
  },

  -- A plugin to visualise and resolve merge conflicts in neovim
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup()
    end,
    event = "BufRead",
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
      require("toggleterm").setup()
    end,
  },

  {
    "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup({
        -- color = '#D13E9E',
        highlight = { fg = "#FF896B", bold = true, italic = true },
        -- highlight = { fg = "#f43e5c" },
        use_colorpalette = false,
        colorpalette = {
          { fg = "#dd571c", bold = true },
          { fg = "#fcae1e", bold = true },
          { fg = "#ed7014", bold = true },
        },
      })
    end,
    event = "BufRead",
  },

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
    "monkoose/neocodeium",
    cmd = "NeoCodium",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup({
        enabled = false,
        show_label = false,
      })
      vim.keymap.set("i", "<C-l>", neocodeium.accept)
      vim.keymap.set("i", "<C-k>", neocodeium.accept)
      vim.keymap.set("i", "<C-;>", neocodeium.cycle_or_complete)
      vim.keymap.set("i", "<C-,>", function()
        neocodeium.cycle_or_complete(-1)
      end)
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufRead",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
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
      }
    end,
  },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require("config.statuscol")
    end,
  },

  {
    "lukas-reineke/headlines.nvim",
    ft = { "markdown", "org", "norg" },
    config = function()
      require("headlines").setup()
    end,
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
    event = "BufRead",
    dependencies = {
      "SmiteshP/nvim-navic",
      "kyazdani42/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup({
        theme = {
          normal = { bg = "#0d1117" },
        },
      })
    end,
  },

  {
    "andrewferrier/debugprint.nvim",
    config = function()
      require("debugprint").setup({ create_keymaps = false, create_commands = false })
    end,
    event = "BufRead",
    keys = {
      {
        "<leader>iV",
        function()
          return require("debugprint").debugprint({ above = true, variable = true })
        end,
        desc = "[i]nsert [V]ariable debug-print above the current line",
        expr = true,
        mode = { "n", "v" },
      },
      {
        "<leader>iv",
        function()
          return require("debugprint").debugprint({ above = false, variable = true })
        end,
        desc = "[i]nsert [v]ariable debug-print below the current line",
        expr = true,
        mode = { "n", "v" },
      },
    },
    version = "1.*",
  },

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-k>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
      })
    end,
    cmd = { "SupermavenUseFree", "SupermavenStart" },
  },

  {
    "abecodes/tabout.nvim",
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    event = "InsertCharPre",
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
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
}
