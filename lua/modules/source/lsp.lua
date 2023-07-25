return {
  -- Neovim lsp function
  ["lspconfig"] = {
    path = "neovim/nvim-lspconfig",
    cmd = "LspStart",
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts = {
          ensure_installed = {
            "stylua",
            "shfmt",
            -- "flake8",
          },
        },
        ---@param opts MasonSettings | {ensure_installed: string[]}
        config = function(_, opts)
          require("mason").setup(opts)
          local mr = require("mason-registry")
          local function ensure_installed()
            for _, tool in ipairs(opts.ensure_installed) do
              local p = mr.get_package(tool)
              if not p:is_installed() then
                p:install()
              end
            end
          end
          if mr.refresh then
            mr.refresh(ensure_installed)
          else
            ensure_installed()
          end
        end,
      },
      "williamboman/mason-lspconfig.nvim",
      {
        "glepnir/lspsaga.nvim",
        config = function()
          require("modules.config.lspsaga")
        end
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("modules.config.nullls")
        end
      }
    }
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
