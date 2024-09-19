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
        javascript = { "prettier", "prettierd", "eslint", "eslint_d", stop_after_first = true },
        javascriptreact = { "prettier", "prettierd", "eslint", "eslint_d", stop_after_first = true },

        json = { "prettier", "fixjson" },
        jsonc = { "prettier", "fixjson" },

        typescript = { "prettier", "prettierd", "eslint", "eslint_d", stop_after_first = true },
        typescriptreact = { "prettier", "prettierd", "eslint", "eslint_d", stop_after_first = true },

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
      require("lint").linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        yaml = { "actionlint" },
        css = { "stylelint" },
      }

      vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        callback = function()
          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          require("lint").try_lint()

          -- You can call `try_lint` with a linter name or a list of names to always
          -- run specific linters, independent of the `linters_by_ft` configuration
          -- require("lint").try_lint("cspell")
        end,
      })
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

  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function()
      require("neodim").setup({
        alpha = 0.65,
        blend_color = "#000000",
        hide = {
          underline = true,
          virtual_text = false,
          signs = true,
        },
        regex = {
          "[uU]nused",
          "[nN]ever [rR]ead",
          "[nN]ot [rR]ead",
        },
        priority = 128,
        disable = {},
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
