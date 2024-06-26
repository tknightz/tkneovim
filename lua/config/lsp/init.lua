-- marked that lsp is started
vim.g.loaded_lsp = 1
vim.g.should_attach = 1

-- this is an error 

local lspconfig = require("lspconfig")
local registry = require("mason-registry")
local installed_packages = registry.get_installed_packages()
local server_mapping = require("mason-lspconfig.mappings.server")
local consts = require("config.lsp.mason.consts")

local win = require("lspconfig.ui.windows")
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = "rounded"
  return opts
end

local diagnostic_opts = {
  underline = true,
  virtual_text = {
    prefix = "  ",
    suffix = " ",
    spacing = 5,
  },
  signs = true,
  update_in_insert = false,
}

vim.diagnostic.config(diagnostic_opts)

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

vim.diagnostic.config({
  signs = {
    --support diagnostic severity / diagnostic type name
    text = { [1] = ' ', ['WARN'] = '󰀦 ', ['HINT'] = ' ' },
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_opts)

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
