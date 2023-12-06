local function on_attach(client, bufnr)
  -- Load signature_help
  -- require('lsp_signature').on_attach({
  --   bind = true,
  --   hint_prefix = "🌸 ",
  --   handler_opts = {
  --     border = "rounded"
  --   },
  --   transparency = 1,
  -- }, bufnr)

  -- load nvim-navic
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end

  -- disable sematic token
  if client.server_capabilities.semanticTokensProvider then
    client.server_capabilities.semanticTokensProvider = nil
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings.
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gs", "<Cmd>split | exec 'lua vim.lsp.buf.definition()' | exec 'norm zt'<CR>", opts)
  buf_set_keymap("n", "gv", "<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
  buf_set_keymap("i", "<C-k>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gI", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end

-- setup cmp (completion)
local _cap = vim.lsp.protocol.make_client_capabilities()
_cap.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
local capabilities = require("cmp_nvim_lsp").default_capabilities(_cap)

return {
  on_attach = on_attach,
  capabilities = capabilities,
}
