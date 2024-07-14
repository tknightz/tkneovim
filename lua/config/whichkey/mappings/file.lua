local wk = require("which-key")

wk.add({
  { "<leader>f", group = "files" },
  { "<leader>fb", ":Telescope marks<cr>", desc = "Book marks" },
  { "<leader>ff", ":Telescope find_files hidden=true<cr>", desc = "Find File" },
  { "<leader>fs", ":update<cr>", desc = "Save File" },
  { "<leader>fh", ":Telescope oldfiles<cr>", desc = "History Files" },
  { "<leader>fn", ":new<cr>", desc = "New File" },
  { "<leader>fr", ":Telescope live_grep_args<cr>", desc = "Grep" },
})
