return {
  ["sphinx"] = {
    path = "stsewd/sphinx.nvim",
    build = ":UpdateRemotePlugins",
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
    build = "cd app && yarn install"
  },

  -- Emmet, quickly expand code html, jsx, tsx
  -- ["emmet"] = {
  --   path = "mattn/emmet-vim",
  --   ft = {"html", "css", "javascriptreact", "typescriptreact" }
  -- },

  ["typescript-tools"] = {
    path = "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", module = "plenary" },
    config = function()
      require("typescript-tools").setup {}
    end,
  },

  -- Note-taking in neovim, orgmode is ported from Emacs
  ["orgmode"] = {
    path = "nvim-orgmode/orgmode",
    ft = "org",
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
    build = ":Neorg sync-parsers",
  }
}
