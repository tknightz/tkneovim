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
end

local function format()
  require("conform").format({ async = true }, format_cb)
end

local function toggle_linter()
  -- local lint = require("lint")

  if vim.g.linter_enabled then
    lint.linters_by_ft = {}
    vim.g.linter_enabled = false
  else
    -- lint.try_lint()
    vim.g.linter_enabled = true
  end
end

wk.add({
  { "<leader>l", group = "lsp", mode = { "n", "v" } },
  { "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "actions" },
  { "<leader>ls", function() vim.lsp.buf.signature_help() end, desc = "signature_help" },
  { "<leader>lr", "<cmd>Lspsaga rename<CR>", desc = "rename" },
  { "<leader>ld", "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>", desc = "toggle diagnostics" },
  { "<leader>li", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "issues" },
  { "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "next" },
  { "<leader>lo", "<cmd>Outline<CR>", desc = "outline" },
  { "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "prev" },
  { "<leader>lq", "<cmd>Trouble diagnostics<CR>", desc = "quickfix" },
  { "<leader>ll", toggle_linter, desc = "toggle_linter" },
  { "<leader>lf", format, desc = "format", mode = {"n", "v"} },
  { "<leader>lt", toggle_lsp, desc = "toggle" },
  { "<leader>lh", toggle_inlay_hint, desc = "toggle hint" },
  { "<leader>lS", "<cmd>SymbolsOutline<cr>", desc = "browse" },
  { "<leader>l/", "<cmd>Lspsaga finder<CR>", desc ="finder-saga" },
  { "<leader>l.","<cmd>Telescope lsp_references<CR>", desc = "finder-tele" },

  { "<leader>lv", group = "view" },
  { "<leader>lvd", "<cmd>Lspsaga peek_definition<CR>", desc = "definition" },
  { "<leader>lvt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "type" },
})
