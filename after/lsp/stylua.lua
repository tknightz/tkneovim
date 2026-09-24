return {
  cmd = { "stylua", "--lsp" },
  filetypes = { "lua" },
  root_markers = { "stylua.toml", ".git" },
  single_file_support = true,
  settings = {
    -- Language server only provides formatting via textDocument/formatting
    -- Actual formatting done via conform.nvim
  },
}