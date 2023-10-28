local eslint_project_func = function()
  return {
    exe = "/home/tknightz/.local/share/nvim/mason/bin/vscode-eslint-language-server",
    args = { "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix", "--cache" },
    stdin = false,
    try_node_modules = true,
  }
end
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,

  filetype = {
    typescript = {
      require("formatter.filetypes.typescript").prettier,
      require("formatter.filetypes.typescript").eslint_d,
      -- eslint_project_func,
    },
    typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
    javascript = { require("formatter.filetypes.javascript").prettier },
  }
}
