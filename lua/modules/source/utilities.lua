return {
  -- Fuzzy search all the stuffs
  ["telescope"] = {
    path = "nvim-telescope/telescope.nvim",
    commit = "3f5f165447d797576206e3b9bd555ea8db85b6f2",
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
      "devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Neotree" },
  },

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
        modes_denylist = { "i" },
        large_file_cutoff = 2000
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
    event = "BufRead",
  },

  -- ["hlchunk"] = {
  --   path = "shellRaining/hlchunk.nvim",
  --   config = function()
  --     require("hlchunk").setup({
  --       chunk = {
  --         notify = false,
  --         style = {
  --           { fg = "#c75ae8" },
  --           { fg = "#f65866" }, -- this fg is used to highlight wrong chunk
  --         },
  --       },
  --       blank = {
  --         enable = true,
  --         chars = { " " },
  --       },
  --       line_num = { enable = false },
  --     })
  --   end,
  --   event = "BufReadPre",
  -- },

  -- ["indent-scope"] = {
  --   path = "echasnovski/mini.indentscope",
  --   branch = "stable",
  --   event = "BufRead",
  --   config = function()
  --     require("mini.indentscope").setup({
  --       draw = {
  --         priority = 100,
  --       },
  --       symbol = "│",
  --       options = { try_as_border = true },
  --     })
  --   end,
  -- },

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
    version = "*",
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
        -- highlight = { fg = "#FF896B", bold = true, italic = true },
        highlight = { fg = "#f43e5c" },
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
    cmd = { "CBlcline", "CBlcbox" },
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
    event = "BufEnter",
  },

  ["gpt"] = {
    path = "jackMort/ChatGPT.nvim",
    cmd = {"ChatGPT", "ChatGPTRun"},
    config = function()
      local home = vim.fn.expand("$HOME")
      require("chatgpt").setup({
        api_key_cmd = "cat " .. home .. "/.openai_key"
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "telescope"
    }
  },

  -- ["focus"] = {
  --   path = "nvim-focus/focus.nvim",
  --   version = "*",
  --   config = function()
  --     require("focus").setup({
  --       ui = { signcolumn = false }
  --     })
  --   end,
  --   event = "BufRead",
  -- },

  ["hurl"] = {
    path = "jellydn/hurl.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "hurl",
    config = function()
      require("hurl").setup()
    end,
  },
}
