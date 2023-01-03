local lspsaga = require('lspsaga')

lspsaga.init_lsp_saga({
  border_style = 'rounded',
  symbol_in_winbar = {
    enable = true,
    in_custom = true,
    show_file = true,
    separator = " ",
  },
  show_outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 40,
    auto_enter = false,
    auto_preview = true,
    virt_text = '│',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  diagnostic_header = { "😡 ", "😥 ", "😤 ", "😐 " },
})
