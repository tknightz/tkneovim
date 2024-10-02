local lspsaga = require("lspsaga")

lspsaga.setup({
  border_style = "rounded",
  symbol_in_winbar = {
    enable = false,
    in_custom = false,
    show_file = false,
    separator = " ",
  },
  outline = {
    win_position = "right",
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_width = 35,
    auto_enter = false,
    auto_preview = true,
    virt_text = "│",
    -- auto refresh when change buffer
    auto_refresh = true,
    keys = {
      jump = "o",
      quit = "q",
    }
  },
  code_action = { show_preview = false },
  ui = {
    theme = "round",
    winblend = 30,
    border = "rounded",
    colors = {
      normal_bg = "NONE",
    },
  },
  lightbulb = {
    virtual_text = false,
  },
  diagnostic = {
    on_insert_follow = true,
    on_insert = false,
  },
})
