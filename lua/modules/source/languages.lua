return {
  ["sphinx"] = {
    path = "stsewd/sphinx.nvim",
    build = ":UpdateRemotePlugins",
    ft = { "python" },
  },

  ["go"] = {
    path = "ray-x/go.nvim",
    ft = "go",
  },

  -- Like its name, open markdown preview on browser
  ["mdpreview"] = {
    path = "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && yarn install",
  },

  -- Emmet, quickly expand code html, jsx, tsx
  ["emmet"] = {
    path = "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
  },

  ["typescript-tools"] = {
    path = "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "lspconfig" },
    config = function()
      require("typescript-tools").setup({
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
          -- client.server_capabilities.semanticTokensProvider = nil
        end,
        settings = {
          publish_diagnostic_on = "change",
          tsserver_max_memory = 3072,
          separate_diagnostic_server = false,
        },
      })
    end,
    lazy = true,
  },
}
