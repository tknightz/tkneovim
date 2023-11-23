local lib = require("lib")
lib.load_module("telescope")

require("ezterm").setup({
  theme = "dropdown",
  previewer = true,
  init_mode = "insert",
})
