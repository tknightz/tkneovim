return {
  -- Fuzzy search all the stuffs
  ["telescope"] = {
    path = "nvim-telescope/telescope.nvim",
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

    cmd = "Telescope",
  },

  ["neotree"] = {
    path = "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Neotree" },
  },

  -- Tired of Undo things?
  ["mundo"] = {
    path = "simnalamburt/vim-mundo",
    cmd = { "MundoShow", "MundoToggle" },
  },

  -- Pretty fold with preview feature
  -- ["prettyfold"] = {
  --   path = "anuvyklack/pretty-fold.nvim",
  --   event = "BufRead",
  -- },

  ["ufo"] = {
    path = "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufRead",
  },

  -- Highlight cursor word
  ["illuminate"] = {
    path = "RRethy/vim-illuminate",
    event = "BufRead",
    config = function()
      local special_fts = require("lib.consts").special_fts
      require("illuminate").configure({
        filetypes_denylist = special_fts,
      })
    end,
  },

  -- Better buffer delete
  ["bufdelete"] = {
    path = "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
  },

  -- Quickly jump between windows
  ["winjumping"] = {
    path = "s1n7ax/nvim-window-picker",
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
  ["indentguide"] = {
    path = "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
  },

  ["indent-scope"] = {
    path = "echasnovski/mini.indentscope",
    branch = "stable",
    event = "BufRead",
    config = function()
      require("mini.indentscope").setup({
        draw = {
          priority = 100,
        },
        symbol = "│",
        options = { try_as_border = true },
      })
    end,
  },

  -- Extended f, F, t and T key mappings
  ["cleverf"] = {
    path = "rhysd/clever-f.vim",
    event = "BufRead",
  },

  -- Even better % navigate and highlight matching words
  ["matchup"] = {
    path = "andymass/vim-matchup",
    event = "BufRead",
  },

  -- Better search
  ["autohls"] = {
    path = "asiryk/auto-hlsearch.nvim",
    version = "1.1.0",
    config = function()
      require("auto-hlsearch").setup({
        remap_keys = { "/", "?", "*", "!", "#", "n", "N" },
        create_commands = true,
      })
    end,
    keys = { "/", "?", "*", "#" },
  },

  -- Sometimes need to focus in one window
  -- but dont want to close others
  ["maximizer"] = {
    path = "szw/vim-maximizer",
    cmd = { "MaximizerToggle" },
  },

  -- Interact with databases inside Neovim
  -- ["dadbodui"] = {
  --   path = "kristijanhusak/vim-dadbod-ui",
  --   dependencies = {
  --     "tpope/vim-dadbod",
  --     {
  --       "kristijanhusak/vim-dadbod-completion",
  --       init = function()
  --         vim.g.vim_dadbod_completion_mark = "Database"
  --       end,
  --     },
  --   },
  --   cmd = { "DBUI", "DBUIAddConnection", "DBUIToggle" },
  -- },

  ["dbee"] = {
    path = "kndndrj/nvim-dbee",
    dependencies = { "MunifTanjim/nui.nvim" },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup()
    end,
    lazy = true,
  },
  -- Nice looking notifications with animation
  ["notify"] = {
    path = "rcarriga/nvim-notify",
    module = "notify",
  },

  -- Smooth scrolling
  ["neoscroll"] = {
    path = "karb94/neoscroll.nvim",
    event = "BufRead",
  },

  -- Organize keymaps
  ["whichkey"] = {
    path = "folke/which-key.nvim",
    keys = { "<leader>", "<Space>", { "<leader>", mode = "v" } },
  },

  -- Measure startup-time
  ["startuptime"] = {
    path = "tweekmonster/startuptime.vim",
    cmd = "StartupTime",
  },

  ["bqf"] = {
    path = "kevinhwang91/nvim-bqf",
    dependencies = { "pqf" },
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
  ["pqf"] = {
    path = "yorickpeterse/nvim-pqf",
    config = function()
      require("pqf").setup({
        signs = {
          error = " ",
          warning = " ",
          info = " ",
          hint = " ",
        },
      })
    end,
  },

  -- A plugin to visualise and resolve merge conflicts in neovim
  ["gitconflict"] = {
    path = "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
    event = "BufRead",
  },

  -- Jump to last edit
  ["lastplace"] = {
    path = "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup({})
    end,
  },

  ["winshift"] = {
    path = "sindrets/winshift.nvim",
    cmd = "WinShift",
    config = function()
      require("winshift").setup()
    end,
  },

  ["toggleterm"] = {
    path = "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    config = function()
      require("toggleterm").setup()
    end,
  },

  ["hlargs"] = {
    path = "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup({
        -- color = '#D13E9E',
        highlight = { fg = "#FF896B", bold = true, italic = true },
        use_colorpalette = false,
        colorpalette = {
          { fg = "#dd571c", bold = true },
          { fg = "#fcae1e", bold = true },
          { fg = "#ed7014", bold = true },
        },
      })
    end,
    event = "Bufread",
  },

  ["treejoin"] = {
    path = "Wansmer/treesj",
    cmd = { "TSJToggle" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },

  ["navic"] = {
    path = "SmiteshP/nvim-navic",
    event = "LspAttach",
  },

  ["comment-box"] = {
    path = "LudoPinelli/comment-box.nvim",
    cmd = { "CBline", "CBcbox" },
    config = function()
      require("comment-box").setup()
    end,
  },

  ["codeium"] = {
    path = "Exafunction/codeium.vim",
    cmd = "Codeium",
    config = function()
      vim.keymap.set("i", "<C-l>", function()
        return vim.fn["codeium#Accept"]()
      end, { silent = true, expr = true })
      vim.keymap.set("i", "<C-k>", function()
        return vim.fn["codeium#Accept"]()
      end, { silent = true, expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },

  ["textobj"] = {
    path = "chrisgrieser/nvim-various-textobjs",
    event = "BufRead",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  },

  ["move"] = {
    path = "fedepujol/move.nvim",
    cmd = { "MoveBlock", "MoveLine", "MoveHBlock", "MoveHChar" },
  },

  -- ["spider"] = {
  --   path = "chrisgrieser/nvim-spider",
  --   event = "BufRead",
  --   config = function()
  --     -- Keymaps
  --     vim.keymap.set({"n", "o", "x"}, "w", function() require("spider").motion("w") end, { desc = "Spider-w" })
  --     vim.keymap.set({"n", "o", "x"}, "e", function() require("spider").motion("e") end, { desc = "Spider-e" })
  --     vim.keymap.set({"n", "o", "x"}, "b", function() require("spider").motion("b") end, { desc = "Spider-b" })
  --     vim.keymap.set({"n", "o", "x"}, "ge", function() require("spider").motion("ge") end, { desc = "Spider-ge" })
  --     vim.keymap.set({"n", "o", "x"}, "cw", "ce", { desc = "Change word" })
  --   end
  -- },

  ["rainbow"] = {
    path = "HiPhish/rainbow-delimiters.nvim",
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

  ["statuscol"] = {
    path = "luukvbaal/statuscol.nvim",
    event = "VeryLazy",
  },

  ["rest"] = {
    path = "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "<Plug>RestNvim" },
    commit = "8b62563",
    config = function()
      require("rest-nvim").setup()
    end,
  },

  ["distant"] = {
    path = "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
      require("distant"):setup()
    end,
    cmd = { "DistantConnect" },
  },

  ["headlines"] = {
    path = "lukas-reineke/headlines.nvim",
    ft = { "markdown", "org" },
    config = function()
      require("headlines").setup()
    end,
  },

  ["edgy"] = {
    path = "folke/edgy.nvim",
    event = "VeryLazy",
  },

  ["octo"] = {
    path = "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "telescope",
      "nvim-web-devicons",
    },
    config = function ()
      require("octo").setup()
    end,
    cmd = {"Octo"},
  },

  -- ["bettersearch"] = {
  --   path = "backdround/improved-search.nvim",
  --   dependencies = { "autohls" },
  --   event = "BufRead",
  --   config = function()
  --     local search = require("improved-search")
  --
  --     -- Search next / previous.
  --     vim.keymap.set({"n", "x", "o"}, "n", search.stable_next)
  --     vim.keymap.set({"n", "x", "o"}, "N", search.stable_previous)
  --
  --     -- Search current word without moving.
  --     vim.keymap.set("n", "!", search.current_word)
  --
  --     -- Search selected text in visual mode
  --     vim.keymap.set("x", "!", search.in_place) -- search selection without moving
  --     vim.keymap.set("x", "*", search.forward)  -- search selection forward
  --     vim.keymap.set("x", "#", search.backward) -- search selection backward
  --
  --     -- Search by motion in place
  --     vim.keymap.set("n", "|", search.in_place)
  --     -- You can also use search.forward / search.backward for motion selection.
  --   end
  -- }
}
