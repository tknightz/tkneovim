local wk = require("which-key")

local function toggle_mouse()
  if vim.o.mouse == "a" then
    vim.o.mouse = ""
  else
    vim.o.mouse = "a"
  end
end

local function toggle_ai()
  if vim.g.enable_ai == 1 then
    vim.cmd("SupermavenStop")
    vim.g.enable_ai = 0
  else
    vim.cmd("SupermavenUseFree")
    vim.g.enable_ai = 1
  end
end

wk.add({
  { "<leader>e", group = "editing" },

  { "<leader>ea", toggle_ai, desc = "AI completion" },
  { "<leader>ef", "<cmd>Neotree reveal<cr>", desc = "toggle file explorer" },
  { "<leader>ey", '"+y', desc = "yanks" },
  { "<leader>eY", "%y+<cr>", desc = "whole yanks" },
  { "<leader>es", "<cmd>set spell!<cr>", desc = "toggle spell" },
  { "<leader>eh", "<cmd>set hlsearch!<cr>", desc = "toggle hlsearch" },
  { "<leader>em", toggle_mouse, desc = "mouse on" },
  { "<leader>en", "<cmd>tabnext<cr>", desc = "next tab" },
  { "<leader>eN", "<cmd>tabnew<cr>", desc = "new tab" },
  { "<leader>ex", "<cmd>tabclose<cr>", desc = "close tab" },
  { "<leader>ep", "<cmd>tabprevious<cr>", desc = "prev tab" },
})
