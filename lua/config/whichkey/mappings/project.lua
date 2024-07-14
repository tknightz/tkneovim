local wk = require("which-key")

wk.add({
  { "<leader>p", group = "project" },
  { "<leader>pn", ":tabnext<cr>", desc = "next" },
  { "<leader>pp", ":tabprevious<cr>", desc = "prev" },
  { "<leader>ps", ":Telescope projects<cr>", desc = "search" },
  { "<leader>pi", ":tabnew<cr>", desc = "init" },
})
