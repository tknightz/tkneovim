return {
  -- Fuzzy search all the stuffs
  ["telescope"] = {
    path = "nvim-telescope/telescope.nvim",
    dependencies = {
      -- { "nvim-lua/popup.nvim", module = "popup" },
      { "nvim-lua/plenary.nvim", module = "plenary" },
      { "nvim-telescope/telescope-symbols.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
      { "tknightz/telescope-termfinder.nvim" }
    },

    cmd = "Telescope",
  },

  -- NvimTree explorer
  -- ["nvimtree"] = {
  --   path = "kyazdani42/nvim-tree.lua",
  --   cmd = {"NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile"}
  -- },

  ["neotree"] = {
    path = "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { 
      { "MunifTanjim/nui.nvim", module = "nui" },
    },
    cmd = {"Neotree"}
  },

  -- Tired of Undo things?
  ["mundo"] = {
    path = "simnalamburt/vim-mundo",
    cmd = {"MundoShow", "MundoToggle"}
  },

  -- Pretty fold with preview feature
  ["prettyfold"] = {
    path = "anuvyklack/pretty-fold.nvim",
    event = "BufRead",
  },

  -- Highlight cursor word
  ["illuminate"] = {
    path = "RRethy/vim-illuminate",
    event = "BufRead",
    config = function()
      require('illuminate').configure({
        filetypes_denylist = {
          "TelescopePrompt",
          "prompt",
          "dashboard",
          "NvimTree",
          "dirvish",
          "fugitive",
          "neo-tree",
          "dbui"
        }
      })
    end
  },

  -- Better buffer delete
  ["bufdelete"] = {
    path = "famiu/bufdelete.nvim",
    cmd = {"Bdelete", "Bwipeout"}
  },

  -- Quickly jump between windows
  ["winjumping"] = {
    path = "s1n7ax/nvim-window-picker",
    module = "window-picker",
    version = 'v2.*',
    config = function()
      require('window-picker').setup{
        filter_rules = {
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { },
          },
        }
      }
    end
  },

  -- Indent guides for Neovim
  ["indentguide"] = {
    path = "lukas-reineke/indent-blankline.nvim",
  },

  ["indent-scope"] = {
    path = "echasnovski/mini.indentscope",
    branch = "stable",
    config = function()
      require('mini.indentscope').setup({ 
        symbol = "│",
        options = { try_as_border = true },
      })
    end,
  },

  -- Extended f, F, t and T key mappings
  ["cleverf"] = {
    path = "rhysd/clever-f.vim",
    event = "BufRead"
  },

  -- Even better % navigate and highlight matching words 
  ["matchup"] = {
    path = "andymass/vim-matchup",
    event = "BufRead"
  },

  -- Better search
  ["autohls"] = {
    path = "asiryk/auto-hlsearch.nvim",
    version = "1.0.0",
    config = function()
      require("auto-hlsearch").setup({
        remap_keys = { "/", "?", "*", "#", "n", "N" },
        create_commands = true,
      })
    end,
    keys = {"/", "?", "*", "#"},
  },

  -- Sometimes need to focus in one window
  -- but dont want to close others
  ["maximizer"] = {
    path = "szw/vim-maximizer",
    cmd = {"MaximizerToggle"}
  },

  -- Move around with speed of light
  ["lightspeed"] = {
    path = "ggandor/lightspeed.nvim",
    keys = {"gz", "gZ"}
  },

  -- Interact with databases inside Neovim
  ["dadbodui"] = {
    path = "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      { 
        "kristijanhusak/vim-dadbod-completion", init = function()
          vim.g.vim_dadbod_completion_mark = 'Database'
        end
      },
    },
    cmd = {"DBUI", "DBUIAddConnection", "DBUIToggle"},
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
    keys = {"<leader>", "<Space>"},
  },

  -- Measure startup-time
  ["startuptime"] = {
    path = "tweekmonster/startuptime.vim",
    cmd = "StartupTime" 
  },

  ["bqf"] = {
    path = "kevinhwang91/nvim-bqf",
    ft = "qf"
  },

  -- pretty quickfix UI
  ["pqf"] = {
    path = "https://gitlab.com/yorickpeterse/nvim-pqf.git",
    config = function()
      require('pqf').setup({
        signs = {
          error = ' ',
          warning = ' ',
          info = ' ',
          hint = ' '
        }
      })
    end,
  },

  -- Prettier format code
  ["prettier"] = {
    path = "prettier/vim-prettier",
    cmd = {"Prettier", "PrettierAsync", "PrettierFragment"},
    build = "npm install"
  },

  -- A plugin to visualise and resolve merge conflicts in neovim
  ["gitconflict"] = {
    path = "akinsho/git-conflict.nvim",
    config = function()
      require('git-conflict').setup()
    end,
    event = "BufRead"
  },

  -- Jump to last edit
  ["lastplace"] = {
    path = "ethanholz/nvim-lastplace",
    config = function()
      require('nvim-lastplace').setup{}
    end,
  },

  ["winshift"] = {
    path = "sindrets/winshift.nvim",
    cmd = "WinShift",
    config = function()
      require("winshift").setup()
    end
  },

  ["toggleterm"] = {
    path = "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    config = function()
      require("toggleterm").setup()
    end
  },

  ["editorconfig"] = {
    path = "gpanders/editorconfig.nvim",
    event = "VimEnter",
  },

  ["vgit"] = {
    path = "tanvirtin/vgit.nvim",
    config = function()
      require("vgit").setup()
    end,
    cmd = "VGit"
  },

  ["hlargs"] = {
    path = "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup({
        highlight = { fg = "#dd571c", bold = true },
        use_colorpalette = true,
        colorpalette = {
          { fg = "#dd571c", bold = true },
          { fg = "#fcae1e", bold = true },
          { fg = "#ed7014", bold = true },
        },
      })
    end,
    event = "Bufread",
  },
  --
  -- ["scrollbar"] = {
  --   path = "petertriho/nvim-scrollbar",
  --   config = function()
  --     require("scrollbar").setup()
  --   end,
  --   event = "BufRead",
  -- },

  ["treejoin"] = {
    path = "Wansmer/treesj",
    cmd = {"TSJToggle"},
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end
  },

  ["navic"] = {
    path = "SmiteshP/nvim-navic",
  },

  ["comment-box"] = {
    path = "LudoPinelli/comment-box.nvim",
    cmd = {"CBline", "CBcbox"},
    config = function()
      require('comment-box').setup()
    end
  },

  ["codeium"] = {
    path = "Exafunction/codeium.vim",
    cmd = "Codeium",
    config = function()
      vim.keymap.set('i', '<C-l>', function () return vim.fn['codeium#Accept']() end, { silent = true, expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },

  ["spider"] = {
    path = "chrisgrieser/nvim-spider",
    event = "BufRead",
    config = function()
      -- Keymaps
      vim.keymap.set({"n", "o", "x"}, "w", function() require("spider").motion("w") end, { desc = "Spider-w" })
      vim.keymap.set({"n", "o", "x"}, "e", function() require("spider").motion("e") end, { desc = "Spider-e" })
      vim.keymap.set({"n", "o", "x"}, "b", function() require("spider").motion("b") end, { desc = "Spider-b" })
      vim.keymap.set({"n", "o", "x"}, "ge", function() require("spider").motion("ge") end, { desc = "Spider-ge" })
      vim.keymap.set({"n", "o", "x"}, "cw", "ce", { desc = "Change word" })
    end
  },
}
