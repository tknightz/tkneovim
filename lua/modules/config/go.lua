require("go").setup({
  goimport = "goimports", -- goimport command
  gofmt = "gofmt", --gofmt cmd,
  max_line_len = 120, -- max line length in goline format
  tag_transform = false, -- tag_transfer  check gomodifytags for details
  test_template = "", -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
  test_template_dir = "", -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
  comment_placeholder = "   ", -- comment_placeholder your cool placeholder e.g. ﳑ       
  verbose = false, -- output loginf in messages
  lsp_cfg = false, -- true: apply go.nvim non-default gopls setup
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = false, -- if a on_attach function provided:  attach on_attach function to gopls
  -- true: will use go.nvim on_attach if true
  -- nil/false do nothing
})
