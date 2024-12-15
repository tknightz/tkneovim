function biome_format()
  local biome_config_path = vim.fn.getcwd() .. "/biome.json"
  if vim.fn.filereadable(biome_config_path) ~= 0 then
    return { "biome" }
  else
    return { "prettier", "eslint", "eslint_d", stop_after_first = true }
  end
end

require("conform").setup({
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
    typescript = biome_format,
    typescriptreact = biome_format,
    -- astro = biome_format,
    astro = { "prettier" },

    css = { "prettier", stop_after_first = true },

    svelte = { "prettier", stop_after_first = true },

    sql = { "sql_formatter" },
  },
})
