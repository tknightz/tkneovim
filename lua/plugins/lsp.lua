return {
  -- Neovim lsp function
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
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

  -- {
  --   "Kyren223/lspsaga.nvim",
  --   version = "main",
  --   event = "LspAttach",
  --   config = function()
  --     require("config.lspsaga")
  --   end,
  -- },
  {
    "Chaitanyabsprip/fastaction.nvim",
    event = "LspAttach",
    opts = {},
    config = function(opts)
      require("fastaction").setup(opts)

      vim.keymap.set("n", "<leader>lr", ":IncRename ")
    end
  },

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
    end
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

  {
    "hedyhli/outline.nvim",
    cmd = "Outline",
    config = function()
      require("config.outline")
    end,
  },

  -- fidget for showing progress
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      progress = {
        ignore_empty_message = false,
        display = {
          progress_icon = {
            pattern = "arc",
          },
          done_icon = " ",
        },
      },
    },
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
