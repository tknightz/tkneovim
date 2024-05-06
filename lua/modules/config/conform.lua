local util = require("conform.util")
local sql_config = vim.fn.stdpath("config") .. "/lua/modules/config/masonlspconfig/.sqlformatter.json"

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = {{ "prettier", "prettierd", "eslint", "eslint_d" }},
    javascriptreact = {{ "prettier", "prettierd", "eslint", "eslint_d" }},

    json = { "fixjson" },

    typescript = {{ "prettier", "prettierd", "eslint", "eslint_d" }},
    typescriptreact = {{ "prettier", "prettierd", "eslint", "eslint_d" }},

    astro = {{ "biome", "prettier" }},

    sql = { "sql_formatter" },
  },

  formatters = {
    sql_formatter = {
      args = { "--config", sql_config },
    },
    -- prettier = {
    --   args = function(self, ctx)
    --     if vim.endswith(ctx.filename, ".astro") then
    --       return {
    --         "--stdin-filepath",
    --         "$FILENAME",
    --         "--plugin",
    --         "prettier-plugin-astro",
    --         "--plugin",
    --         "prettier-plugin-tailwindcss",
    --       }
    --     end
    --     return { "--stdin-filepath", "$FILENAME", "--plugin", "prettier-plugin-tailwindcss" }
    --   end,
    -- },
  }
})
