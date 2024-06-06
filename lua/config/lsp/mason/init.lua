local mason_lspconfig = require("mason-lspconfig")
local consts = require("config.lsp.mason.consts")

-- Need to call it, before nvim-lspinstall provides new hooks
mason_lspconfig.setup({
  ensure_installed = consts.ensure_installed_servers,
  automatic_installation = true,
})
