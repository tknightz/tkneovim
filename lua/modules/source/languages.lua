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

  -- Note-taking in neovim, orgmode is ported from Emacs
  ["orgmode"] = {
    path = "nvim-orgmode/orgmode",
    ft = "org"
  },
}
