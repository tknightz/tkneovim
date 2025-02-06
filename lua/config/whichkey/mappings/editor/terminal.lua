local wk = require("which-key")

wk.add({
  { "<leader>t", group = "terminal/toggle" },
  { "<leader>tn", "<cmd>ToggleTerm<cr>", desc = "new" },
  { "<leader>tl", "<cmd>lopen<cr>", desc = "loclist" },
  { "<leader>tq", "<cmd>copen<cr>", desc = "quickfix" },
})
