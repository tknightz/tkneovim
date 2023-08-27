local mason_lspconfig = require("mason-lspconfig")
local consts = require("modules.config.masonlspconfig.consts")

-- Need to call it, before nvim-lspinstall provides new hooks
mason_lspconfig.setup({
  ensure_installed = consts.ensure_installed_servers,
  automatic_installation = true,
})
