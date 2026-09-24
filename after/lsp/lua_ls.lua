return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".git", "lua/", "stylua.toml" },
  single_file_support = true,
  settings = {
    Lua = {
      runtime = { version = "Lua 5.1" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = { vim.env.VIMRUNTIME },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}