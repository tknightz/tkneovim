local wk = require("which-key")

wk.add({
  { "<leader>w", group = "windows" },

  { "<leader>ww", "<C-W>w", desc = "other-window" },
  { "<leader>wd", "<C-W>c", desc = "delete-window" },
  { "<leader>wh", "<C-W>h", desc = "window-left" },
  { "<leader>wj", "<C-W>j", desc = "window-below" },
  { "<leader>wl", "<C-W>l", desc = "window-right" },
  { "<leader>wk", "<C-W>k", desc = "window-up" },
  { "<leader>wH", "<C-W>5<", desc = "expand-window-left" },
  { "<leader>wJ", "<cmd>resize +5<cr>", desc = "expand-window-below" },
  { "<leader>wL", "<C-W>5>", desc = "expand-window-right" },
  { "<leader>wK", "<cmd>resize -5<cr>", desc = "expand-window-up" },
  { "<leader>wv", "<C-W>v", desc = "split-window-below" },
  { "<leader>w=", "<C-W>=", desc = "balance-window" },
  { "<leader>w-", "<C-W>s", desc = "split-window-below" },
  { "<leader>w/", "<C-W>v", desc = "split-window-right" },

  -- Window transform
  { "<leader>wt", group = "transform" },
  { "<leader>wtj", "<cmd>wincmd J<cr>", desc = "swap-window-vertical" },
  { "<leader>wth", "<cmd>wincmd H<cr>", desc = "swap-window-horizontal" },
})
