local wk = require("which-key")

wk.add({
  { "<leader>f", group = "files" },
  { "<leader>fb", "<cmd>Telescope marks<cr>", desc = "Book marks" },
  { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find File" },
  { "<leader>fs", "<cmd>update<cr>", desc = "Save File" },
  { "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "History Files" },
  { "<leader>fn", "<cmd>new<cr>", desc = "New File" },
  { "<leader>fr", "<cmd>Telescope live_grep_args<cr>", desc = "Grep" },
})
