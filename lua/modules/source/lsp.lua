return {
  -- Neovim lsp function
  ["lspconfig"] = {
    path = "neovim/nvim-lspconfig",
    dependencies = { "mason", "masonlspconfig", "typescript-tools" },
    lazy = true,
    cmd = "LspStart",
  },

  ["mason"] = {
    path = "williamboman/mason.nvim",
    cmd = "Mason",
    module = "mason",
    config = function()
      require("mason").setup()
    end
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
    lazy = true,
  },

  ["conform"] = {
    path = "stevearc/conform.nvim",
    lazy = true,
  },

  -- Find trouble in your code
  ["trouble"] = {
    path = "folke/trouble.nvim",
    cmd = { "Trouble" }
  },

  ["symbolsoutline"] = {
    path = "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },

  ["fidget"] = {
    path = "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
  },
}
