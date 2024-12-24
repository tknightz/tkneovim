return {
  -- Neovim lsp function
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "rachartier/tiny-inline-diagnostic.nvim",
    },
    lazy = true,
    cmd = "LspStart",
    config = function()
      require("config.lsp")
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    config = function()
      require("config.lsp.mason")
    end,
  },

  -- Display float window actions for LSP
  {
    "Chaitanyabsprip/fastaction.nvim",
    event = "LspAttach",
    opts = {},
    config = function(opts)
      require("fastaction").setup(opts)

      vim.keymap.set("n", "<leader>lr", ":IncRename ")
    end,
  },

  -- LSP rename
  {
    "smjonas/inc-rename.nvim",
    event = "LspAttach",
    config = function()
      require("inc_rename").setup()
    end,
  },

  -- conform for formatting
  {
    "stevearc/conform.nvim",
    lazy = true,
    config = function()
      require("config.conform")
    end,
  },

  -- lint for diagnostics
  {
    "mfussenegger/nvim-lint",
    event = "LspAttach",
    config = function()
      require("config.lint")
    end,
  },

  -- Find trouble in your code
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup({})
    end,
  },

  -- Outline (overview) for your code
  {
    "hedyhli/outline.nvim",
    cmd = "Outline",
    config = function()
      require("config.outline")
    end,
  },

  -- Inline diagnostics
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        signs = {
          diag = "● ",
          arrow = "    ",
          up_arrow = "    ",
          vertical = " │",
          vertical_end = " └",
        },
        options = {
          show_all_diags_on_cursorline = true,
          multiple_diag_under_cursor = true,
          multilines = true,
          break_line = {
            enabled = true,
            after = 30,
          },
        },
      })
    end,
  },

  -- {
  --   "dnlhc/glance.nvim",
  --   event = "LspAttach",
  --   config = function()
  --     require("glance").setup()
  --
  --     -- mappings
  --     vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
  --     vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
  --     vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
  --     vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
  --   end,
  -- },
}
