local wk = require("which-key")
local snack_search_fn = require("lib").snack_search_fn

local function toggle_inlay_hint()
  if vim.g.loaded_lsp == 0 then
    return
  end
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

local function toggle_lsp()
  if vim.g.loaded_lsp == 1 then
    vim.lsp.stop_client(vim.lsp.get_clients(), true)
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
  local lint = require("lint")

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
  { "<leader>la", "<cmd>lua require('fastaction').code_action()<CR>", desc = "actions" },
  { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "signature_help" },
  { "<leader>ld", "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>", desc = "toggle diagnostics" },
  { "<leader>li", "<cmd>lua vim.diagnostic.open_float({ scope = 'line' })<CR>", desc = "issues" },
  { "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "next" },
  { "<leader>lo", "<cmd>Outline<CR>", desc = "outline" },
  { "<leader>lp", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "prev" },
  { "<leader>lq", "<cmd>Trouble diagnostics<CR>", desc = "quickfix" },
  { "<leader>ll", toggle_linter, desc = "toggle_linter" },
  { "<leader>lf", format, desc = "format", mode = {"n", "v"} },
  { "<leader>lt", toggle_lsp, desc = "toggle" },
  { "<leader>lh", toggle_inlay_hint, desc = "toggle hint" },
  { "<leader>l/", snack_search_fn("lsp_references"), desc ="references" },

  { "<leader>lv", group = "view" },
  { "<leader>lvd", snack_search_fn("lsp_definitions"), desc = "definition" },
  { "<leader>lvi", snack_search_fn("lsp_implementations"), desc = "implementation" },
  { "<leader>lvr", snack_search_fn("lsp_references"), desc = "references" },
  { "<leader>lvt", snack_search_fn("lsp_type_definitions"), desc = "types" },
})
