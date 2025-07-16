local lsputils = require("config.lsp.utils")

return {
  settings = {
    complete_function_calls = true,
    diagnostics = { ignoredCodes = { 6133 } },
    vtsls = {
      autoUseWorkspaceTsdk = false,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
          entriesLimit = 30,
        },
      },
    },
    typescript = {
      tsserver = {
        nodePath = "/usr/bin/electron",
        maxTsServerMemory = 3072,
      },
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
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
