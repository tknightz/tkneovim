local wk = require("which-key")

wk.add({
  { "<leader>m", group = "modules" },
  { "<leader>mi", ":Lazy install<cr>", desc = "install" },
  { "<leader>mc", ":Lazy clean<cr>", desc = "clean" },
  { "<leader>ms", ":Lazy sync<cr>", desc = "sync" },
  { "<leader>mS", ":Lazy show<cr>", desc = "status" },
  { "<leader>mu", ":Lazy update<cr>", desc = "update" },
  { "<leader>ml", ":Lazy load<cr>", desc = "load" },
})
