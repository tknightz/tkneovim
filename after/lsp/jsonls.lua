return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git", "package.json" },
  single_file_support = true,
  settings = {
    json = {
      schemas = {},
      validate = { enable = true },
    },
  },
}