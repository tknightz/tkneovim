require("gitsigns").setup {
  signs = {
    add = {hl = "GitSignsAdd", text = "▏", numhl = "GitSignsAddNr"},
    change = {hl = "GitSignsChange", text = "▏", numhl = "GitSignsChangeNr"},
    delete = {hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr"},
    topdelete = {hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr"},
    changedelete = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr"}
  },
  numhl = false,
  watch_gitdir = {
    interval = 100
  },
  sign_priority = 5,
  status_formatter = nil -- Use default
}
