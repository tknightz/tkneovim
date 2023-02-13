local lspsaga = require('lspsaga')

lspsaga.setup({
  border_style = 'rounded',
  symbol_in_winbar = {
    enable = false,
    in_custom = false,
    show_file = false,
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
  ui = {
    theme = "round",
    border = "rounded",
    code_action = "🍬",
    colors = {
      normal_bg = "NONE",
    }
  },
})
