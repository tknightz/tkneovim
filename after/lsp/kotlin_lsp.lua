return {
  cmd = { "kotlin-lsp", "--stdio" },
  filetypes = { "kotlin" },
  root_markers = { "build.gradle.kts", "build.gradle", ".git" },
  single_file_support = true,
}