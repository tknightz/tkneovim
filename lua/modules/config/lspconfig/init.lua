vim.g.loaded_lsp = 1

vim.fn.sign_define("DiagnosticSignError", {text = " ", numhl = "LspDiagnosticsDefaultError", texthl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("DiagnosticSignWarning", {text = " ", numhl = "LspDiagnosticsDefaultWarning", texthl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("DiagnosticSignInformation", {text = " ", numhl = "LspDiagnosticsDefaultInformation", texthl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("DiagnosticSignHint", {text = " ", numhl = "LspDiagnosticsDefaultHint", texthl = "LspDiagnosticsDefaultHint"})
