require("gitsigns").setup {
  signs = {
    add = {hl = "GitSignsAdd", text = "▏", numhl = "GitSignsAddNr"},
    change = {hl = "GitSignsChange", text = "▏", numhl = "GitSignsChangeNr"},
    delete = {hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr"},
    topdelete = {hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr"},
    changedelete = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr"}
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    delay = 500,
  },
  current_line_blame_formatter = '  <author>, <author_time:%Y-%m-%d> - <summary>',
  numhl = false,
  watch_gitdir = {
    interval = 100
  },
  sign_priority = 0,
  status_formatter = nil -- Use default
}
