local wk = require("which-key")

wk.setup({
  delay = 500,
  plugins = {
    marks = true, -- shows a list attention of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, edds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },

    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments", ["v"] = "Visual Mode" },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    rules = false,
  },
  win = {
    no_overlap = false,
    border = "rounded", -- none, single, double, shadow
    padding = { 1, 1 }, -- extra window padding [top, right, bottom, left]
    wo = {
      winblend = 5,
    }
  },
  layout = {
    height = { min = 2, max = 10 }, -- min and max height of the columns
    width = { min = 25 }, -- min and max width of the columns
    align = "center",
    spacing = 5, -- spacing between columns
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  triggers_nowait = {
    "<leader>",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  -- triggers = { "<leader>", "<C-r>", "z=" }, -- or specify a list manually
})
