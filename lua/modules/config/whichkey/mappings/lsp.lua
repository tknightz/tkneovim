return {
  name = "LSP",

  a = {":Lspsaga code_action<CR>",            "actions"},
  s = {":Lspsaga signature_help<CR>",         "signature_help"},
  r = {":Lspsaga rename<CR>",                 "rename"},
  d = {":lua vim.lsp.definition()<CR>",       "definitions"},
  i = {":Lspsaga show_line_diagnostics<CR>",  "issues"},
  n = {":lua vim.diagnostic.goto_next()<CR>", "next"},
  p = {":lua vim.diagnostic.goto_prev()<CR>", "prev"},
  f = {":lua vim.lsp.buf.formatting()<CR>",   "format"},
}
