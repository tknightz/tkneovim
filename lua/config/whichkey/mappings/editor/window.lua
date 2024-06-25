local normal = {
  w = { "<C-W>w", "other-window" },
  d = { "<C-W>c", "delete-window" },
  ["-"] = { "<C-W>s", "split-window-below" },
  ["/"] = { "<C-W>v", "split-window-right" },
  h = { "<C-W>h", "window-left" },
  j = { "<C-W>j", "window-below" },
  l = { "<C-W>l", "window-right" },
  k = { "<C-W>k", "window-up" },
  H = { "<C-W>5<", "expand-window-left" },
  J = { "<cmd>resize +5<cr>", "expand-window-below" },
  L = { "<C-W>5>", "expand-window-right" },
  K = { "<cmd>resize -5<cr>", "expand-window-up" },
  ["="] = { "<C-W>=", "balance-window" },
  v = { "<C-W>v", "split-window-below" },

  t = {
    name = "transform",
    j = { "<cmd>wincmd J<cr>", "swap-window-vertical" },
    h = { "<cmd>wincmd H<cr>", "swap-window-horizontal" },
  },
}

return {
  name = "+windows",
  normal = normal,
  visual = normal,
}
