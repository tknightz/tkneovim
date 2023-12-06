-- marked that lsp is started
vim.g.loaded_lsp = 1

local lspconfig = require("lspconfig")
local registry = require("mason-registry")
local installed_packages = registry.get_installed_packages()
local server_mapping = require("mason-lspconfig.mappings.server")
local consts = require("modules.config.masonlspconfig.consts")

local win = require("lspconfig.ui.windows")
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = "rounded"
  return opts
end

vim.fn.sign_define(
  "DiagnosticSignError",
  { text = " ", numhl = "LspDiagnosticsDefaultError", texthl = "LspDiagnosticsDefaultError" }
)
vim.fn.sign_define(
  "DiagnosticSignWarn",
  { text = "󰀦 ", numhl = "LspDiagnosticsDefaultWarning", texthl = "LspDiagnosticsDefaultWarning" }
)
vim.fn.sign_define(
  "DiagnosticSignInfo",
  { text = "󰋼 ", numhl = "LspDiagnosticsDefaultInfo", texthl = "LspDiagnosticsDefaultInformation" }
)
vim.fn.sign_define(
  "DiagnosticSignHint",
  { text = " ", numhl = "LspDiagnosticsDefaultHint", texthl = "LspDiagnosticsDefaultHint" }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = { spacing = 4 },
  signs = true,
  update_in_insert = true,
})

-- Iterate to register servers with custom config
for _, server in pairs(installed_packages) do
  if consts.is_lsp_server(server) then
    local server_name = server_mapping.package_to_lspconfig[server.name]
    local custom_config = consts.custom_configs[server_name]

    local config = custom_config and vim.tbl_extend("force", consts.general_configs, custom_config)
      or consts.general_configs

    if server_name == "gopls" then
      config.init_options = nil
    end
    lspconfig[server_name].setup(config)
  end
end
