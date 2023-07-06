return {
  ["sphinx"] = {
    path = "stsewd/sphinx.nvim",
    run = ":UpdateRemotePlugins",
    ft = {"python"},
  },

  ["go"] = {
    path = "ray-x/go.nvim",
    ft = "go",
  },

  -- Like its name, open markdown preview on browser
  ["mdpreview"] = {
    path = "iamcco/markdown-preview.nvim",
    ft = {"markdown"},
    run = "cd app && yarn install"
  },

  -- Emmet, quickly expand code html, jsx, tsx
  ["emmet"] = {
    path = "mattn/emmet-vim",
    ft = {"html", "css", "javascriptreact", "typescriptreact" }
  },

  ["typescript-tools"] = {
    path = "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", module = "plenary" },
    after = "lspconfig",
    config = function()
      require("typescript-tools").setup {}
    end,
  },

  -- Note-taking in neovim, orgmode is ported from Emacs
  ["orgmode"] = {
    path = "nvim-orgmode/orgmode",
    ft = "org",
    after = "treesitter",
  },

  ["neorg"] = {
    path = "nvim-neorg/neorg",
    ft = "norg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
    run = ":Neorg sync-parsers",
  }
}
