require("gitsigns").setup({
  signs = {
    add = { linehl = "DiffAdd", text = "┃", numhl = "GitSignsAddNr" },
    change = { linehl = "DiffChange", text = "┃", numhl = "GitSignsChangeNr" },
    delete = { linehl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { linehl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { linehl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
    untracked = { linehl = "DiffUntracked", text = "╎", numhl = "GitSignsUntracked" },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    delay = 500,
  },
  current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> - <summary>",
  numhl = true,
  watch_gitdir = {
    interval = 100,
  },
  sign_priority = 0,
  status_formatter = nil, -- Use default
})
