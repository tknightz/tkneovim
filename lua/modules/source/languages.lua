return {

  -- Indentation for python, treesitter is not working
  -- properly now.
  ["pyindent"] = {
    path = "Vimjas/vim-python-pep8-indent",
    ft = {"python"},
  },

  ["sphinx"] = {
    path = "stsewd/sphinx.nvim",
    run = ":UpdateRemotePlugins",
    ft = {"python"},
  },

  -- Better indentation for js over treesitter ident feature now.
  ["jsxpretty"] = {
    path = "MaxMEllon/vim-jsx-pretty",
    ft = {"javascript", "javascriptreact", "typescriptreact", "typescript"}
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

  -- Nice looking heading in orgmode
  ["orgbullets"] = {
    path = "akinsho/org-bullets.nvim",
    ft = "org",
  },

  ["headlines"] = {
    path = "lukas-reineke/headlines.nvim",
    config = function()
      require('headlines').setup{}
    end,
    ft = {"org", "markdown"}
  },

}
