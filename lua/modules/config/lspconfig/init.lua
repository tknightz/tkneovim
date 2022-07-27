vim.g.loaded_lsp = 1

vim.fn.sign_define("DiagnosticSignError", {text = " ", numhl = "LspDiagnosticsDefaultError", texthl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", numhl = "LspDiagnosticsDefaultWarning", texthl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", numhl = "LspDiagnosticsDefaultInfo", texthl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("DiagnosticSignHint", {text = " ", numhl = "LspDiagnosticsDefaultHint", texthl = "LspDiagnosticsDefaultHint"})
