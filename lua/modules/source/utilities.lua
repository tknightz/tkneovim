return {
  -- Fuzzy search all the stuffs
  ["telescope"] = {
    path = "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim", module = "popup" },
      { "nvim-lua/plenary.nvim", module = "plenary" },
      { "nvim-telescope/telescope-symbols.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-project.nvim", after = "telescope" },
      { 'nvim-telescope/telescope-live-grep-raw.nvim', before = "telescope" },
    },

    cmd = "Telescope",
  },

  -- NvimTree explorer
  ["nvimtree"] = {
    path = "kyazdani42/nvim-tree.lua",
    cmd = {"NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile"}
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
    event = "BufRead"
  },

  -- Better buffer delete
  ["bufdelete"] = {
    path = "famiu/bufdelete.nvim",
    cmd = {"Bdelete", "Bwipeout"}
  },

  -- Quickly jump between windows
  ["winjumping"] = {
    path = "tknightz/window-jumping.lua",
    cmd = "WindowJumping"
  },

  -- Indent guides for Neovim
  ["indentguide"] = {
    path = "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre"
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
    cmd = "MaximizerToggle"
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
    requires = {
      {"tpope/vim-dadbod", opt = true}
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
  
  -- Really fast minimap renderer
  ["minimap"] = {
    path = "wfxr/minimap.vim",
    cmd = {"Minimap", "MinimapToggle"}
  },

  -- Prettier format code
  ["prettier"] = {
    path = "prettier/vim-prettier",
    run = "yarn install --frozen-lockfile --production",
    cmd = {"Prettier", "PrettierAsync", "PrettierFragment"}
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
  }

  --[[-- Modern nvim tree
  ["neotree"] = {
    path = "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      { "MunifTanjim/nui.nvim", module="nui" },
    },
    cmd = {"Neotree", "NeoTreeRevealToggle"},
  },]]

}
