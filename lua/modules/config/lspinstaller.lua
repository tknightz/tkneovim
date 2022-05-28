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
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    handlers = {
      ['textDocument/publishDiagnostics'] = function() end
    },
    init_options = {
      preferences = {
        disableSuggestions = true
      }
    }
  },

  eslint = {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = util.root_pattern("package.json", ".eslintrc.json", ".eslintrc.js")
  }
}

local installed_servers = lsp_installer.get_installed_servers()
for _, server in pairs(installed_servers) do
  local custom_config = CUSTOM_CONFIGS[server.name]

  local config = custom_config and vim.tbl_extend("force", DEFAULT_CONFIGS, custom_config) or DEFAULT_CONFIGS
  lspconfig[server.name].setup(config)
end
