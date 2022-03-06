local util = require("lspconfig/util")
local lspconf = require("lspconfig")
local preset = require("modules.config.lspconfig.preset")

local languageServers = require("modules.config.lspconfig.langservers")


for lsp, userConfig in pairs(languageServers) do
  local common = {
    on_attach = preset.on_attach,
    capabilities = preset.capabilities,
  }

  local _config = vim.tbl_extend("keep", userConfig, common )

  lspconf[lsp].setup { _config }

end


vim.fn.sign_define("DiagnosticSignError", {text = " ", numhl = "LspDiagnosticsDefaultError", texthl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("DiagnosticSignWarning", {text = " ", numhl = "LspDiagnosticsDefaultWarning", texthl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("DiagnosticSignInformation", {text = " ", numhl = "LspDiagnosticsDefaultInformation", texthl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("DiagnosticSignHint", {text = " ", numhl = "LspDiagnosticsDefaultHint", texthl = "LspDiagnosticsDefaultHint"})
