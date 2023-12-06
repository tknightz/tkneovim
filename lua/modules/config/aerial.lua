local icons = require("modules.config.lspconfig.icons").icons

require("aerial").setup({
  backends = { "lsp", "treesitter" },
  icons = icons,
})
