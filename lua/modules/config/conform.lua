require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettier", "prettierd", "eslint", "eslint_d" } },
    javascriptreact = { { "prettier", "prettierd", "eslint", "eslint_d" } },

    typescript = { { "prettier", "prettierd", "eslint", "eslint_d" } },
    typescriptreact = { { "prettier", "prettierd", "eslint", "eslint_d" } },
  },
})
