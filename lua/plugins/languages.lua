return {
  -- Like its name, open markdown preview on browser
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
