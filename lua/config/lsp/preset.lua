local function on_attach(client, bufnr)
  if vim.g.should_attach == 0 then
    client.stop()
  end

  -- load nvim-navic
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end

  -- disable semantic token
  if client.server_capabilities.semanticTokensProvider then
    client.server_capabilities.semanticTokensProvider = nil
  end

  -- enable inlay hint
  if client.server_capabilities.inlayHintProvider and vim.fn.has("nvim-0.10.0") == 1 then
    -- vim.lsp.inlay_hint.enable(true)
    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "gray", italic = true })
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings.
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gs", '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="split"})<CR>', opts)
  buf_set_keymap("n", "gv", '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gI", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end

-- setup cmp (completion)
-- local _cap = vim.lsp.protocol.make_client_capabilities()
-- _cap.textDocument.foldingRange = {
--   dynamicRegistration = false,
--   lineFoldingOnly = true,
-- }
-- local capabilities = require("cmp_nvim_lsp").default_capabilities(_cap)
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

return {
  on_attach = on_attach,
  capabilities = capabilities,
}
