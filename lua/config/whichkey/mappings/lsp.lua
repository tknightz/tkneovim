local wk = require("which-key")

local function toggle_inlay_hint()
  if vim.g.loaded_lsp == 0 then
    return
  end
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

local function toggle_lsp()
  if vim.g.loaded_lsp == 1 then
    vim.lsp.stop_client(vim.lsp.get_active_clients(), true)
    vim.g.loaded_lsp = 0
    vim.g.should_attach = 0
  else
    vim.cmd("LspStart")
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
  { "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "actions" },
  { "<leader>ls", "<cmd>Lspsaga signature_help<CR>", desc = "signature_help" },
  { "<leader>lr", "<cmd>Lspsaga rename<CR>", desc = "rename" },
  { "<leader>ld", "<cmd>lua vim.diagnostic.enable(false)<CR>", desc = "toggle diagnostics" },
  { "<leader>li", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "issues" },
  { "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "next" },
  { "<leader>lo", "<cmd>Outline<CR>", desc = "outline" },
  { "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "prev" },
  { "<leader>lq", "<cmd>Trouble diagnostics<CR>", desc = "quickfix" },
  { "<leader>lf", format, desc = "format" },
  { "<leader>lf", format, desc = "format", mode = "v" },
  { "<leader>lt", toggle_lsp, desc = "toggle" },
  { "<leader>lh", toggle_inlay_hint, desc = "toggle hint" },
  { "<leader>lS", "<cmd>SymbolsOutline<cr>", desc = "browse" },
  { "<leader>l/", "<cmd>Lspsaga finder<CR>", desc ="finder-saga" },
  { "<leader>l.","<cmd>Telescope lsp_references<CR>", desc = "finder-tele" },

  { "<leader>lv", group = "view" },
  { "<leader>lvd", "<cmd>Lspsaga peek_definition<CR>", desc = "definition" },
  { "<leader>lvt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "type" },
})
