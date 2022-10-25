local lspsaga = require('lspsaga')

lspsaga.init_lsp_saga({
  border_style = 'rounded',
  symbol_in_winbar = {
    enable = true,
    in_custom = true,
    show_file = true,
    separator = " ",
  },
  diagnostic_header = { "😡 ", "😥 ", "😤 ", "😐 " },
})
