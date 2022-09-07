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
  --[[["preview"] = {
    path = "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup{}
    end,
    after = "lspconfig",
  },]]

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

  ["neogen"] = {
    path = "danymat/neogen",
    cmd = {"Neogen"},
    config = function()
      require('neogen').setup { snippet_engine = "luasnip" }
    end,
    tag = "*"
  }
--[[
  ["fidget"] = {
    path = "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup{
        text = {
          spinner = "dots",
        },
        window = {
          blend = 0,
        }
      }
    end,
    after = "lspconfig"
  } ]]
}
