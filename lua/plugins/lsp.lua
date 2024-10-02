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

  {
    "Kyren223/lspsaga.nvim",
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
        javascript = { "prettier", "prettierd", "eslint", "eslint_d", stop_after_first = true },
        javascriptreact = { "prettier", "prettierd", "eslint", "eslint_d", stop_after_first = true },

        json = { "prettier", "fixjson" },
        jsonc = { "prettier", "fixjson" },

        -- typescript = { "prettier", "eslint", "eslint_d", stop_after_first = true },
        typescript = function(bufnr)
          if require("conform").get_formatter_info("biome", bufnr).available then
            return { "biome" }
          else
            return { "prettier", "eslint", "eslint_d", stop_after_first = true }
          end
        end,
        typescriptreact = function(bufnr)
          if require("conform").get_formatter_info("biome", bufnr).available then
            return { "biome" }
          else
            return { "prettier", "eslint", "eslint_d", stop_after_first = true }
          end
        end,

        css = { "prettier", stop_after_first = true },
        astro = { "biome", "prettier", stop_after_first = true },

        svelte = { "prettier", stop_after_first = true },

        sql = { "sql_formatter" },
      },
    },
  },

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
