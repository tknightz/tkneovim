---@type vim.lsp.Config
return {
  cmd = { "tsgo", "--lsp", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
    "tsconfig.base.json",
  },

  keys = {
    {
      "gd",
      function()
        local params = vim.lsp.util.make_position_params(0, "utf-16")
        lsputils.execute({
          command = "typescript.goToSourceDefinition",
          arguments = { params.textDocument.uri, params.position },
          open = true,
        })
      end,
      desc = "Go to definition",
    },
    { "<leader>lO", lsputils.action["source.organizeImports"], desc = "Organize imports" },
    { "<leader>lC", lsputils.action["source.removeUnused.ts"], desc = "Remove unused code" },
    { "<leader>lF", lsputils.action["source.fixAll.ts"], desc = "Fix all code" },
    { "<leader>lI", lsputils.action["source.addMissingImports.ts"], desc = "Add missing imports" },
  },
}
