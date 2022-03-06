local util = require("lspconfig/util")

return {
  filetypes = {"html", "svelte", "typescriptreact", "javascript"},
  root_dir = util.root_pattern("package.json", ".git", "tailwind.config.js"),
}
