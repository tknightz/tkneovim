local preset = require("modules.config.lspconfig.preset")
local util = require("lspconfig.util")

local M = {}

-- ensure servers for mason
M.ensure_installed_servers = {"sumneko_lua", "tsserver", "yamlls", "pyright"};

-- config that apply to all servers
M.general_configs = {
  capabilities = preset.capabilities,
  on_attach = preset.on_attach,
  init_options = { hostInfo = "neovim" },
}

-- custom configs for specify server
M.custom_configs = {
  gopls = {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
  },

  tsserver = {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    init_options = {
      preferences = {
        disableSuggestions = true
      }
    }
  },

  eslint = {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = util.root_pattern("package.json", ".eslintrc.json", ".eslintrc.js")
  },

  emmet_ls = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] = "*/openapi.(yml|yaml)"
        },
        schemaDownload = { enable = true },
        completion = true,
        validate = true,
      }
    }
  }
}

-- helper function to check if server is lsp
-- only lsp server will be registered here
M.is_lsp_server = function(server)
  for _, name in ipairs(server.spec.categories) do
    if name == "LSP" then
      return true
    end
  end

  return false
end

return M
