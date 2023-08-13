return {
  -- Neovim lsp function
  ["lspconfig"] = {
    path = "neovim/nvim-lspconfig",
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
    dependencies = { "lspconfig", "mason" },
  },

  ["lspsaga"] = {
    path = "nvimdev/lspsaga.nvim",
    event = "LspAttach",
  },

  ["nullls"] = {
    path = "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
  },

  -- ["grammarguard"] = {
  --   path = "brymer-meneses/grammar-guard.nvim",
  --   after = "lspconfig"
  -- },
  --

  -- Find trouble in your code
  ["trouble"] = {
    path = "folke/trouble.nvim",
    cmd = {"Trouble"}
  },

  -- Show signature while typing code
  -- ["signature"] = {
  --   path = "ray-x/lsp_signature.nvim",
  --   module = "lsp_signature",
  --   config = function()
  --     require("lsp_signature").setup({
  --       bind = true,
  --       handler_opts = {
  --         border = "rounded"
  --       },
  --       transparency = 1,
  --     })
  --   end
  -- },

  ["symbolsoutline"] = {
    path = "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },

  ["fidget"] = {
    path = "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
  }
}
