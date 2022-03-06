return {
  -- Neovim lsp function
  ["lspconfig"] = {
    path = "neovim/nvim-lspconfig",
    cmd = "LspStart"
  },

  -- Enhance lsp ui
  ["lspsaga"] = {
    path = "tami5/lspsaga.nvim",
    after = "lspconfig"
  },

  -- Find trouble in your code
  ["trouble"] = {
    path = "folke/trouble.nvim",
    cmd = {"LspTrouble", "LspTroubleToggle", "LspTroubleOpen", "LspWorkplaceOpen"}
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
