return {
  -- Neovim lsp function
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
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

  {
    "nvimdev/lspsaga.nvim",
    version = "main",
    event = "LspAttach",
    config = function()
      require("config.lspsaga")
    end,
  },

  {
    "stevearc/conform.nvim",
    lazy = true,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettier", "prettierd", "eslint", "eslint_d" } },
        javascriptreact = { { "prettier", "prettierd", "eslint", "eslint_d" } },

        json = { "fixjson" },

        typescript = { { "prettier", "prettierd", "eslint", "eslint_d" } },
        typescriptreact = { { "prettier", "prettierd", "eslint", "eslint_d" } },

        astro = { { "biome", "prettier" } },

        sql = { "sql_formatter" },
      },
    },
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
}
