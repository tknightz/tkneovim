local null_ls = require("null-ls")
local util = require("lspconfig.util")

null_ls.setup {
  diagnostics_format = "[#{c}] #{m} (#{s})",
  root_dir = util.root_pattern(".null-ls-root", "package.json", ".eslintrc.json", ".eslintrc.js", "requirements.txt", ".git"),
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint.with({
      command = require("null-ls.helpers.command_resolver").from_node_modules,
      dynamic_command = function()
        return { "eslint", "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" }
      end,
      runtime_condition = function(params)
        return not params.bufname:match "fugitive://"
      end,
    }),
    null_ls.builtins.code_actions.eslint.with({
      command = require("null-ls.helpers.command_resolver").from_node_modules,
      dynamic_command = function()
        return { "eslint", "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" }
      end,
    }),
    null_ls.builtins.completion.spell,

    -- python
    null_ls.builtins.formatting.black.with({
      extra_args = function (params)
        local root = params.root
        local config_path = root .. "/pyproject.toml"
        local is_exist_config = vim.fn.filereadable(config_path)

        return is_exist_config ~= 0 and { "--config", config_path } or {}
      end
    }),
    null_ls.builtins.diagnostics.flake8,
  },
}
