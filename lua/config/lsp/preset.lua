local on_attach_keymaps = {
  { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
  { "gs", "<cmd>vertical winc ]<CR>", desc = "Select next item" },
  { "gv", "<cmd>horizontal winc ]<CR>", desc = "Select prev item" },
  { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover info" },
  { "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
  { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help" },
  { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Find references" },
  { "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", desc = "Previous diagnostic" },
  { "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
}

local function on_attach(client, bufnr)
  if vim.g.should_attach == 0 then
    client.stop()
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
end

-- setup cmp (completion)
local _cap = vim.lsp.protocol.make_client_capabilities()
_cap.textDocument.completion.completionItem.snippetSupport = true
_cap.textDocument.foldingRange = {
  dynamicRegistration = true,
  lineFoldingOnly = true,
}
local capabilities = require("blink.cmp").get_lsp_capabilities(_cap)

return {
  on_attach = on_attach,
  on_attach_keymaps = on_attach_keymaps,
  capabilities = capabilities,
}
