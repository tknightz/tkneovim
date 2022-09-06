local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local preset = require("modules.config.lspconfig.preset")

-- Need to call it, before nvim-lspinstall provides new hooks
lsp_installer.setup{}

local DEFAULT_CONFIGS = {
  capabilities = preset.capabilities,
  on_attach = preset.on_attach,
  init_options = { hostInfo = "neovim" },
}

local CUSTOM_CONFIGS = {
  tsserver = {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    cmd = {'/home/tknightz/.nvm/versions/node/v16.14.2/bin/typescript-language-server', '--stdio'},
    root_dir = util.root_pattern("package.json", ".git"),
  },

  eslint = {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    -- cmd = {"eslint", "--stdio"},
    root_dir = util.root_pattern("package.json", ".eslintrc.js", ".eslintrc.json")
  },

  emmet_ls = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["kubernetes"] = "deploy.yaml",
          ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] = "*/openapi.(yml|yaml)",
        },
        schemaDownload = { enable = true },
        validate = true,
      }
    }
  }
}

local installed_servers = lsp_installer.get_installed_servers()
for _, server in pairs(installed_servers) do
  local custom_config = CUSTOM_CONFIGS[server.name]

  local config = custom_config and vim.tbl_extend("force", DEFAULT_CONFIGS, custom_config) or DEFAULT_CONFIGS
  lspconfig[server.name].setup(config)
end
