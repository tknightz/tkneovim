local wk = require("which-key")

wk.add({
  { "<leader>m", group = "modules" },
  { "<leader>mi", "<cmd>Lazy install<cr>", desc = "install" },
  { "<leader>mc", "<cmd>Lazy clean<cr>", desc = "clean" },
  { "<leader>ms", "<cmd>Lazy sync<cr>", desc = "sync" },
  { "<leader>mS", "<cmd>Lazy show<cr>", desc = "status" },
  { "<leader>mu", "<cmd>Lazy update<cr>", desc = "update" },
  { "<leader>ml", "<cmd>Lazy load<cr>", desc = "load" },
})
