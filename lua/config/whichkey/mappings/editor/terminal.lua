local wk = require("which-key")

wk.add({
  { "<leader>t", group = "terminal" },
  { "<leader>tn", "<cmd>ToggleTerm<cr>", desc = "new" },
  { "<leader>ti", "<cmd>Telescope termfinder find<cr>", desc = "i-term" },
})
