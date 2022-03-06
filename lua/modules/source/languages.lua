return {

  -- Indentation for python, treesitter is not working
  -- properly now.
  ["pyindent"] = {
    path = "Vimjas/vim-python-pep8-indent",
    ft = "python"
  },

  -- Better indentation for js over treesitter ident feature now.
  ["jsxpretty"] = {
    path = "maxmellon/vim-jsx-pretty",
    ft = {"javascript", "javascriptreact", "typescriptreact"}
  },

  ["go"] = {
    path = "ray-x/go.nvim",
    ft = "go",
  },

  -- Like its name, open markdown preview on browser
  -- whenever you open a markdown file
  ["instant-markdown"] = {
    path = "instant-markdown/vim-instant-markdown",
    ft = "markdown"
  },

  -- Emmet, quickly expand code html, jsx, tsx
  ["emmet"] = {
    path = "mattn/emmet-vim",
    ft = {"html", "css", "javascriptreact", "typescriptreact" }
  },

  -- Note-taking in neovim, orgmode is ported from Emacs
  ["orgmode"] = {
    path = "kristijanhusak/orgmode.nvim",
    ft = "org"
  },

  -- Nice looking heading in orgmode
  ["orgbullets"] = {
    path = "akinsho/org-bullets.nvim",
    ft = "org",
  },

}
