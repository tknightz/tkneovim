local wk = require("which-key")

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
    vim.g.should_attach = 0
  else
    vim.cmd("LspStart")
    -- start_lsp()
    vim.g.loaded_lsp = 1
    vim.g.should_attach = 1
  end
end

local function format_cb(err)
  if err then
    vim.notify(" 🚨 Err while formatting!", "error", {
      title = "Formatter",
    })
    return
  end

  vim.notify(" ✨ Format done!", "info", {
    title = "Formatter",
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

wk.add({
  { "<leader>l", group = "lsp" },
  { "<leader>la", ":Lspsaga code_action<CR>", desc = "actions" },
  { "<leader>ls", ":Lspsaga signature_help<CR>", desc = "signature_help" },
  { "<leader>lr", ":Lspsaga rename<CR>", desc = "rename" },
  { "<leader>ld", ":lua vim.diagnostic.enable(false)<CR>", desc = "toggle diagnostics" },
  { "<leader>li", ":Lspsaga show_line_diagnostics<CR>", desc = "issues" },
  { "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>", desc = "next" },
  { "<leader>lo", ":Outline<CR>", desc = "outline" },
  { "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>", desc = "prev" },
  { "<leader>lq", ":Trouble diagnostics<CR>", desc = "quickfix" },
  { "<leader>lf", format, desc = "format" },
  { "<leader>lt", toggle_lsp, desc = "toggle" },
  { "<leader>lh", toggle_inlay_hint, desc = "toggle hint" },
  { "<leader>lS", ":SymbolsOutline<cr>", desc = "browse" },
  { "<leader>l/", ":Lspsaga finder<CR>", desc ="finder-saga" },
  { "<leader>l.",":Telescope lsp_references<CR>", desc = "finder-tele" },
  { "<leader>lv", group = "view" },
  { "<leader>lvd", ":Lspsaga peek_definition<CR>", desc = "definition" },
  { "<leader>lvt", ":Lspsaga peek_type_definition<CR>", desc = "type" },
})
