return {
  -- Snacks - set of some tiny useful plugins (tiny and useful I mean)
  {
    "folke/snacks.nvim",
    priority = 900,
    lazy = false,
    config = function()
      require("config.snacks")
    end,
  },

  -- Fuzzy search all the stuffs
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope-live-grep-args.nvim",
  --     "tknightz/telescope-termfinder.nvim",
  --     {
  --       "nvim-telescope/telescope-fzf-native.nvim",
  --       build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  --     },
  --   },
  --
  --   module = "telescope",
  --   cmd = "Telescope",
  --   config = function()
  --     require("config.telescope")
  --   end,
  -- },

  -- Neo-tree - file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Neotree" },
    config = function()
      require("config.neotree")
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

  -- Quickly jump between windows (integrate with neo-tree)
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

  -- Better search, auto turn off highlight after search
  {
    "nvimdev/hlsearch.nvim",
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

  -- Better quickfix with preview
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

  -- Quicker - better quickfix UI
  {
    "stevearc/quicker.nvim",
    config = function()
      require("config.quicker")
    end,
    ft = "qf",
  },

  -- A plugin to visualise and resolve merge conflicts in neovim
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    -- event = "User FilePost",
  },

  -- Toggleterm - better terminal
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

  -- Join and split lines
  {
    "Wansmer/treesj",
    cmd = { "TSJToggle" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },

  -- Add comment box like its name
  {
    "LudoPinelli/comment-box.nvim",
    cmd = { "CBlcline", "CBlcbox" },
    opts = {},
  },

  -- Rainbow delimiters for parentheses, brackets, braces, etc.
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

  -- Headlines - headlines for markdown
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "org", "norg", "markdown", "mdx", "yaml", "svelte" },
    config = function()
      require("headlines").setup({
        svelte = {
          query = vim.treesitter.query.parse(
            "svelte",
            [[
              (script_element (raw_text) @codeblock)
              (script_element [
                (start_tag)
                (end_tag) 
              ] @headline)
            ]]
          ),
          headline_highlights = { "Headline" },
          bullet_highlights = {
            "@text.title.1.marker.markdown",
            "@text.title.2.marker.markdown",
            "@text.title.3.marker.markdown",
            "@text.title.4.marker.markdown",
            "@text.title.5.marker.markdown",
            "@text.title.6.marker.markdown",
          },
          codeblock_highlight = "CodeBlock",
        },
      })
    end,
  },

  -- Edgy - organize your sidebar and special windows
  {
    "folke/edgy.nvim",
    event = "BufEnter",
    config = function()
      require("config.edgy")
    end,
  },

  -- Dropbar - display breadcrumbs
  {
    "Bekaboo/dropbar.nvim",
    event = "User FilePost",
    config = function()
      local dropbar_api = require("dropbar.api")
      local sources = require("dropbar.sources")

      require("dropbar").setup({
        icons = {
          kinds = {
            symbols = require("config.lsp.icons").icons,
          },
        },
        bar = { sources = { sources.path, sources.lsp, sources.markdown } },
      })

      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },

  -- Supermaven - AI assistant
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

  -- Kulala - http client
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

  -- Autotag - automatically close and rename html tags
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Grug-far - find and replace text
  {
    "MagicDuck/grug-far.nvim",
    opts = {},
    cmd = { "GrugFar" },
  },

  -- Automatically remove buffer when it's not used for a while
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    opts = {
      retirementAgeMins = 10,
      ignoredFiletypes = require("lib.consts").special_fts,
    },
    event = "User FilePost",
  },

  -- Yanky - copy and paste text
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

  -- powerful move text around
  {
    "fedepujol/move.nvim",
    opts = {},
    cmd = { "MoveBlock", "MoveLine", "MoveWord" },
  },

  -- peek the line when type :<line-number>
  {
    "nacro90/numb.nvim",
    opts = {},
    event = "User FilePost",
  },
}
