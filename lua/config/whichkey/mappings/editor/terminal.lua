local wk = require("which-key")

wk.add({
  { "<leader>t", group = "terminal/toggle" },
  { "<leader>tn", "<cmd>ToggleTerm<cr>", desc = "new" },
  { "<leader>ti", "<cmd>Telescope termfinder find<cr>", desc = "i-term" },
  { "<leader>tl", "<cmd>lopen<cr>", desc = "loclist" },
  { "<leader>tq", "<cmd>copen<cr>", desc = "quickfix" },
})
