vim.g.loaded_lsp = 1

local win = require('lspconfig.ui.windows')
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = 'rounded'
  return opts
end

vim.fn.sign_define("DiagnosticSignError", {text = " ", numhl = "LspDiagnosticsDefaultError", texthl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", numhl = "LspDiagnosticsDefaultWarning", texthl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", numhl = "LspDiagnosticsDefaultInfo", texthl = "LspDiagnosticsDefaultInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = " ", numhl = "LspDiagnosticsDefaultHint", texthl = "LspDiagnosticsDefaultHint"})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {spacing = 4},
  signs = true,
  update_in_insert = false
})
