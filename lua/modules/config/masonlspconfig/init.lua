local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local registry = require("mason-registry")
local server_mapping = require("mason-lspconfig.mappings.server")
local consts = require("modules.config.masonlspconfig.consts")

local installed_packages = registry.get_installed_packages();

-- Need to call it, before nvim-lspinstall provides new hooks
mason_lspconfig.setup({
  ensure_installed = consts.ensure_installed_servers,
  automatic_installation = true,
})

-- Iterate to register servers with custom config
for _, server in pairs(installed_packages) do
  if consts.is_lsp_server(server) then
    local server_name = server_mapping.package_to_lspconfig[server.name]
    local custom_config = consts.custom_configs[server_name]
    print(custom_config, server)

    local config = custom_config and vim.tbl_extend("force", consts.general_configs, custom_config) or consts.general_configs

    if server_name == "gopls" then
      config.init_options = nil
    end
    lspconfig[server_name].setup(config)
  end
end
