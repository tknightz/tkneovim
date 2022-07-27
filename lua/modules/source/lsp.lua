return {
  -- Neovim lsp function
  ["lspconfig"] = {
    path = "neovim/nvim-lspconfig",
    cmd = {"LspStart"}
  },

  -- Lsp servers manager
  ["lspinstaller"] = {
    path = "williamboman/nvim-lsp-installer",
    after = "lspconfig"
  },

  ["grammarguard"] = {
    path = "brymer-meneses/grammar-guard.nvim",
    after = "lspconfig"
  },


  -- Enhance lsp ui
  ["lspsaga"] = {
    path = "glepnir/lspsaga.nvim",
    after = "lspconfig"
  },

  -- Find trouble in your code
  ["trouble"] = {
    path = "folke/trouble.nvim",
    cmd = {"Trouble"}
  },

  -- Show signature while typing code
  ["signature"] = {
    path = "ray-x/lsp_signature.nvim",
    module = "lsp_signature"
  },

  -- Show definitions without moving
  ["preview"] = {
    path = "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup{}
    end,
    after = "lspconfig",
  },

  ["symbolsoutline"] = {
    path = "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },

  ["nullls"] = {
    path = "jose-elias-alvarez/null-ls.nvim",
    after = "lspconfig"
  }
}
