-- marked that lsp is started
vim.g.loaded_lsp = 1
vim.g.should_attach = 1

local lspconfig = require("lspconfig")
local registry = require("mason-registry")

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
    text = { [1] = " ", ["WARN"] = "󰀦 ", ["HINT"] = " " },
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_opts)

registry.refresh(function()
  -- Iterate to register servers with custom config
  local installed_servers = require("mason-lspconfig").get_installed_servers()
  local consts = require("config.lsp.mason.consts")

  for _, server in pairs(installed_servers) do
    local custom_config = consts.custom_configs[server]

    local config = custom_config and vim.tbl_extend("force", consts.general_configs, custom_config)
      or consts.general_configs

    if server == "gopls" then
      config.init_options = nil
    end
    lspconfig[server].setup(config)
  end
end)
