local M = {
  sidebar_fts = {
    "fugitive",
    "aerial",
    "Outline",
    "toggleterm",
    "Trouble",
    "qf",
    "dbee-drawer",
    "dbee-result",
    "dbee-call-log",
    "NeogitStatus",
    "NeogitPopup",
    "dbui",
    "dbout",
  },

  special_fts = {
    "TelescopePrompt",
    "prompt",
    "dashboard",
    "NvimTree",
    "dirvish",
    "fugitive",
    "gitcommit",
    "gitrebase",
    "neo-tree",
    "DiffviewFiles",
    "DiffviewFileHistory",
    "aerial",
    "dbui",
    "sagaoutline",
    "Outline",
    "dbui",
    "dbout",
    "qf",
    "Trouble",
    "toggleterm",
    "dbee-drawer",
    "dbee-result",
    "dbee-call-log",
    "NeogitStatus",
    "NeogitPopup",
  }
}

M.is_sidebar_ft = function(ft)
  return vim.tbl_contains(M.sidebar_fts, ft)
end

return M
