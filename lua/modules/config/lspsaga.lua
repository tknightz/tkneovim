local lspsage = require('lspsaga')

lspsage.init_lsp_saga({
  border_style = 'rounded',
  symbol_in_winbar = {
    separator = " ",
  },
  diagnostic_header = { "😡", "😥", "😤", "😐" },
})
