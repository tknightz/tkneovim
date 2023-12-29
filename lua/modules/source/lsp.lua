return {
  -- Neovim lsp function
  ["lspconfig"] = {
    path = "neovim/nvim-lspconfig",
    dependencies = { "mason", "masonlspconfig" },
    lazy = true,
    cmd = "LspStart",
  },

  ["mason"] = {
    path = "williamboman/mason.nvim",
    cmd = "Mason",
    module = "mason",
    config = function()
      require("mason").setup()
    end,
  },

  ["masonlspconfig"] = {
    path = "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },

  ["lspsaga"] = {
    path = "nvimdev/lspsaga.nvim",
    event = "LspAttach",
  },

  ["lint"] = {
    path = "mfussenegger/nvim-lint",
    event = "LspAttach",
  },

  ["conform"] = {
    path = "stevearc/conform.nvim",
    lazy = true,
  },

  -- Find trouble in your code
  ["trouble"] = {
    path = "folke/trouble.nvim",
    cmd = { "Trouble" },
  },

  ["symbolsoutline"] = {
    path = "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },

  ["aerial"] = {
    path = "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialOpen" },
  },

  ["fidget"] = {
    path = "j-hui/fidget.nvim",
    event = "LspAttach",
  },

  -- ["typescript-tools"] = {
  --   path = "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "lspconfig" },
  --   config = function()
  --     local lsp_preset = require("modules.config.lspconfig.preset")
  --     require("typescript-tools").setup({
  --       on_attach = lsp_preset.on_attach,
  --       capabilities = lsp_preset.capabilities,
  --       settings = {
  --         publish_diagnostic_on = "change",
  --         tsserver_max_memory = 3072,
  --         tsserver_path = "/usr/lib/code/extensions/node_modules/typescript/lib/tsserver.js",
  --         -- separate_diagnostic_server = false,
  --       },
  --     })
  --   end,
  --   lazy = true,
  -- },
}
