local function start_lsp()
  pcall(require, "lspconfig")
  pcall(require, "mason-lspconfig")

  pcall(require, "lint")
end

local function toggle_inlay_hint()
  if vim.g.loaded_lsp == 0 then
    return
  end
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

local function toggle_lsp()
  if vim.g.loaded_lsp == 1 then
    -- vim.cmd("LspStop")
    vim.lsp.stop_client(vim.lsp.get_active_clients(), true)
    vim.g.loaded_lsp = 0
  else
    vim.cmd("LspStart")
    start_lsp()
    vim.g.loaded_lsp = 1
  end
end

local function format_cb(err)
  if err then
    vim.notify(" 🚨 Err while formating!", "error", {
      title = "Formater",
    })
    return
  end

  vim.notify(" ✨ Format done!", "info", {
    title = "Formater",
  })

  -- call linter if any
  if not vim.g.lint_loaded then
    return
  end

  local lint = require("lint")
  lint.try_lint()
end

local function format()
  require("conform").format({
    async = true,
    lsp_fallback = true,
  }, format_cb)
end

return {
  name = "lsp",

  normal = {
    a = { ":Lspsaga code_action<CR>", "actions" },
    s = { ":Lspsaga signature_help<CR>", "signature_help" },
    r = { ":Lspsaga rename<CR>", "rename" },
    d = { ":Lspsaga preview_definition<CR>", "definitions" },
    i = { ":Lspsaga show_line_diagnostics<CR>", "issues" },
    n = { ":Lspsaga diagnostic_jump_next<CR>", "next" },
    o = { ":Outline<CR>", "outline" },
    p = { ":Lspsaga diagnostic_jump_prev<CR>", "prev" },
    q = { ":lua vim.diagnostic.setloclist()<CR>", "quickfix" },
    f = { format, "format" },
    t = { toggle_lsp, "toggle" },
    h = { toggle_inlay_hint, "toggle hint" },
    S = { ":SymbolsOutline<cr>", "browse" },
    ["/"] = { ":Lspsaga finder<CR>", "finder-saga" },
    ["."] = { ":Telescope lsp_references<CR>", "finder-tele" },
    v = {
      name = "view",
      d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "definition" },
      i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "implementation" },
      r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "references" },
      x = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "close all" },
    },
  },

  visual = {
    f = { format, "format" },
  },
}
