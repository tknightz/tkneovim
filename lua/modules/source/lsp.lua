return {
  -- Neovim lsp function
  ["lspconfig"] = {
    path = "neovim/nvim-lspconfig",
    cmd = "LspStart"
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
    path = "tami5/lspsaga.nvim",
    after = "lspconfig"
  },

  -- Find trouble in your code
  ["trouble"] = {
    path = "folke/trouble.nvim",
    cmd = {"Trouble", "TroubleToggle", "TroubleOpen"},
    config = function()
      require("trouble").setup{}
    end
  },

  -- Show signature while typing code
  ["signature"] = {
    path = "ray-x/lsp_signature.nvim",
    module = "lsp_signature"
  },

  -- Show definitions without moving
  ["preview"] = {
    path = "rmagatti/goto-preview",
    cmd = {"PreviewDef", "PreviewImpl", "PreviewClose"},
  },
}
