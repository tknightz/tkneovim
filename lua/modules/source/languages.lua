return {
  ["sphinx"] = {
    path = "stsewd/sphinx.nvim",
    build = ":UpdateRemotePlugins",
    ft = { "python" },
  },

  ["go"] = {
    path = "ray-x/go.nvim",
    ft = "go",
  },

  -- Like its name, open markdown preview on browser
  ["mdpreview"] = {
    path = "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && yarn install",
  },
}
