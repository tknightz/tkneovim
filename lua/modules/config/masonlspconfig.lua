local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local preset = require("modules.config.lspconfig.preset")

-- Need to call it, before nvim-lspinstall provides new hooks
local INSTALLED_SERVERS = {"sumneko_lua", "tsserver", "eslint", "yamlls", "pyright"};
mason_lspconfig.setup({
  ensure_installed = INSTALLED_SERVERS,
  automatic_installation = true,
})



local DEFAULT_CONFIGS = {
  capabilities = preset.capabilities,
  on_attach = preset.on_attach,
  init_options = { hostInfo = "neovim" },
}

local CUSTOM_CONFIGS = {
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

for _, server in pairs(INSTALLED_SERVERS) do
  local custom_config = CUSTOM_CONFIGS[server]

  local config = custom_config and vim.tbl_extend("force", DEFAULT_CONFIGS, custom_config) or DEFAULT_CONFIGS
  lspconfig[server].setup(config)
end
