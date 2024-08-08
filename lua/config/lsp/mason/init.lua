local mason_lspconfig = require("mason-lspconfig")

-- Need to call it, before nvim-lspinstall provides new hooks
mason_lspconfig.setup({
  automatic_installation = true,
})
