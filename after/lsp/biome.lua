local lsputils = require("config.lsp.utils")

return {
  cmd = { lsputils.get_local_binary("biome"), "lsp-proxy" },
  root_markers = { 'biome.json' },
  filetypes = { "typescript", "typescriptreact", "javascript", "html", "css", "svelte", "typescript.tsx" },
}
