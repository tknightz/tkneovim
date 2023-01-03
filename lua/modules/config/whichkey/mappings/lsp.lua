local function toggle_lsp()
  local has_nullls, nullls = pcall(require, "null-ls")

  if vim.g.loaded_lsp == 1 then
    vim.cmd("LspStop")

    if has_nullls then
      nullls.disable{}
    end

    vim.g.loaded_lsp = 0
  else
    vim.cmd("LspStart")

    if has_nullls then
      nullls.enable{}
    end

    vim.g.loaded_lsp = 1
  end

end

return {
  name = "LSP",

  a = {":Lspsaga code_action<CR>",             "actions"},
  s = {":Lspsaga signature_help<CR>",          "signature_help"},
  r = {":Lspsaga rename<CR>",                  "rename"},
  d = {":Lspsaga preview_definition<CR>",      "definitions"},
  i = {":Lspsaga show_line_diagnostics<CR>",   "issues"},
  n = {":Lspsaga diagnostic_jump_next<CR>",    "next"},
  o = {":SymbolsOutline<CR>",                  "outline"},
  p = {":Lspsaga diagnostic_jump_prev<CR>",    "prev"},
  q = {":lua vim.diagnostic.setloclist()<CR>", "quickfix"},
  f = {":lua vim.lsp.buf.format({ async = true })<CR>", "format"},
  t = {toggle_lsp,                             "toggle"},
  S = {":SymbolsOutline<cr>",                  "browse"},
  ["/"] = {":Lspsaga lsp_finder<CR>",          "finder-saga"},
  ["."] = {":Telescope lsp_references<CR>",    "finder-tele"},
  v = {
    name = "view",
    d = {"<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "definition"},
    i = {"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "implementation"},
    r = {"<cmd>lua require('goto-preview').goto_preview_references()<CR>", "references"},
    x = {"<cmd>lua require('goto-preview').close_all_win()<CR>", "close all"},
  }
}
