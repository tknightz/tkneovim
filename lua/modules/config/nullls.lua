local null_ls = require("null-ls")
local util = require("lspconfig.util")

null_ls.setup {
  diagnostics_format = "[#{c}] #{m} (#{s})",
  root_dir = util.root_pattern(".null-ls-root", "requirements.txt", ".git"),
  sources = {
    -- null_ls.builtins.formatting.prettier.with({
    --   condition = function(utils)
    --     return utils.root_has_file("node_modules/.bin/prettier") and not utils.root_has_file("node_modules/.bin/prettierd")
    --   end,
    -- }),
    null_ls.builtins.formatting.prettierd.with({
      condition = function(utils)
        return utils.root_has_file(".prettierrc")
        -- return utils.root_has_file("node_modules/.bin/prettierd") and not utils.root_has_file("node_modules/.bin/prettier")
      end,
    }),
    null_ls.builtins.formatting.sql_formatter.with({
      extra_args = function()
        local default_config_path = vim.fn.stdpath("config") .. "/lua/modules/config/masonlspconfig/.sqlformatter.json"
        return { "--config", default_config_path }
      end
    }),
    -- null_ls.builtins.diagnostics.eslint.with({
    --   condition = function(utils)
    --     return utils.root_has_file("node_modules/.bin/eslint") and not utils.root_has_file("node_modules/.bin/eslint_d")
    --   end,
    --   runtime_condition = function(params)
    --     return not params.bufname:match "fugitive://"
    --   end,
    -- }),
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file(".eslintrc") or utils.root_has_file(".eslintrc.js") or utils.root_has_file("package.json")
        -- return utils.root_has_file("node_modules/.bin/eslint_d")
      end,
      runtime_condition = function(params)
        return not params.bufname:match "fugitive://"
      end,
    }),
    -- null_ls.builtins.completion.spell,

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
