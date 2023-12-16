local icons = require("modules.config.lspconfig.icons").icons
require("nvim-navic").setup({
  icons = icons,
  highlight = true,
  separator = " > ",
})
