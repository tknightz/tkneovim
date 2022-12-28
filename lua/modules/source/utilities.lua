return {
  -- Fuzzy search all the stuffs
  ["telescope"] = {
    path = "nvim-telescope/telescope.nvim",
    requires = {
      -- { "nvim-lua/popup.nvim", module = "popup" },
      { "nvim-lua/plenary.nvim", module = "plenary" },
      { "nvim-telescope/telescope-symbols.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { 'nvim-telescope/telescope-live-grep-args.nvim', before = "telescope" },
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
    branch = "v2.x",
    requires = { 
      { "MunifTanjim/nui.nvim", module = "nui" },
    },
    cmd = {"NeoTree", "NeoTreeRevealToggle"}
  },

  -- Faster filetype detection
  ["filetype"] = {
    path = "nathom/filetype.nvim",
    config = function()
      require("filetype").setup{}
    end,
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
          "fugitive"
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
    tag = 'v1.*',
    config = function()
      require('window-picker').setup{
        filter_rules = {
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { },
          },
        },
        fg_color = "#1d1d2c",
        other_win_hl_color = "#e6c384",
      }
    end
  },

  -- Indent guides for Neovim
  ["indentguide"] = {
    path = "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
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
  ["incsearch"] = {
    path = "haya14busa/is.vim",
    keys = "/"
  },

  -- Sometimes need to focus in one window
  -- but dont want to close others
  ["maximizer"] = {
    path = "szw/vim-maximizer",
    cmd = {"MaximizerToggle"}
  },

  -- Run code inside Nvim
  ["sniprun"] = {
    path = "michaelb/sniprun",
    run = "bash ./install.sh",
    cmd = {"SnipRun", "SnipInfo"}
  },

  -- Move around with speed of light
  ["lightspeed"] = {
    path = "ggandor/lightspeed.nvim",
    keys = {"gz", "gZ"}
  },

  -- Interact with databases inside Neovim
  ["dadbodui"] = {
    path = "kristijanhusak/vim-dadbod-ui",
    requires = { "tpope/vim-dadbod" },
    cmd = {"DBUI", "DBUIAddConnection", "DBUIToggle"},
  },

  ["dadbod_completion"] = {
    path = "kristijanhusak/vim-dadbod-completion",
    setup = function()
      vim.g.vim_dadbod_completion_mark = 'Database'
    end,
    after = "dadbodui"
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

  -- Distraction free - writing mode
  ["truezen"] = {
    path = "Pocco81/TrueZen.nvim",
    cmd = {"TZMinimalist", "TZFocus", "TZAtaraxis"},
  },

  -- Float terminals
  ["ezterm"] = {
    path = "tknightz/ezterm.nvim",
    cmd = {"Ezterm", "EztermFind"},
    module = "ezterm"
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
    run = "npm install"
  },

  ["bracey"] = {
    path = "turbio/bracey.vim",
    run = "npm install --prefix server",
    cmd = "Bracey",
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
    tag = "*",
    cmd = "ToggleTerm",
    config = function()
      require("toggleterm").setup()
    end
  },

  ["toggletermfinder"] = {
    path = "tknightz/telescope-termfinder.nvim",
    after = "telescope"
  },

  ["editorconfig"] = {
    path = "gpanders/editorconfig.nvim",
    event = "VimEnter",
  },

  ["fcursorhold"] = {
    path = "antoinemadec/FixCursorHold.nvim",
    event = "CursorHold",
  },

  ["vgit"] = {
    path = "tanvirtin/vgit.nvim",
    config = function()
      require("vgit").setup()
    end,
    cmd = "VGit"
  },

  ["stablize"] = {
    path = "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end,
    event = "WinNew",
  },

  ["hlargs"] = {
    path = "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup({
        highlight = { fg = "#e95678", italic = true }
      })
    end,
    after = "treesitter",
  },

  ["scrollbar"] = {
    path = "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
    event = "BufRead",
  },

  ["treejoin"] = {
    path = "Wansmer/treesj",
    cmd = {"TSJToggle"},
    config = function()
      require("treesj").setup()
    end
  },

  ["printer"] = {
    path = "rareitems/printer.nvim",
    keys = "gp",
    config = function()
        require('printer').setup({
            keymap = "gp" -- Plugin doesn't have any keymaps by default
          })
    end
  },

  ["navic"] = {
    path = "SmiteshP/nvim-navic",
  },
}
