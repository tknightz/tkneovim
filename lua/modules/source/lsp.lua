return {
  -- Neovim lsp function
  ["lspconfig"] = {
    path = "neovim/nvim-lspconfig",
    cmd = {"LspStart"}
  },

  -- Lsp servers manager
  ["mason"] = {
    path = "williamboman/mason.nvim",
    module = "mason",
    config = function()
      require("mason").setup()
    end
  },

  ["masonlspconfig"] = {
    path = "williamboman/mason-lspconfig.nvim",
    after = "lspconfig"
  },

  -- ["grammarguard"] = {
  --   path = "brymer-meneses/grammar-guard.nvim",
  --   after = "lspconfig"
  -- },
  --

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
    module = "lsp_signature",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        handler_opts = {
          border = "rounded"
        },
        transparency = 1,
      })
    end
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
    config = function()
      require("symbols-outline").setup()
    end,
    cmd = "SymbolsOutline",
  },

  ["nullls"] = {
    path = "jose-elias-alvarez/null-ls.nvim",
    after = "lspconfig"
  },

  ["fidget"] = {
    path = "j-hui/fidget.nvim",
    after = "theme",
  }
}
