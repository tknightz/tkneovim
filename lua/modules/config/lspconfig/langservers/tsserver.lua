local util = require("lspconfig/util")

return {
  snippetSupport = true,
  cmd = {"typescript-language-server", "--stdio"},
  root_dir = util.root_pattern("package.json"),
}
