local wk = require("which-key")
local snack_search_fn = require("lib").snack_search_fn

wk.add({
  { "<leader>b", group = "buffers" },
  { "<leader>bn", "<cmd>bnext<cr>", desc = "next" },
  { "<leader>bp", "<cmd>bprevious<cr>", desc = "previous" },
  { "<leader>bd", "<cmd>lua Snacks.bufdelete()<cr>", desc = "delete" },
  { "<leader>bi", snack_search_fn("buffers"), desc = "IBuffers" },
  { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "jump" },
  { "<leader>bs", "<cmd>BufferLineSortByRelativeDirectory<cr>", desc = "sort" },
  { "<leader>bX", "<cmd>BufferLineCloseOthers<cr>", desc = "close otherse" },
  { "<leader>bc", "<cmd>Cppath<cr>", desc = "copy file path" },
  { "<leader>b/", snack_search_fn("lines"), desc = "buffer lines" },
})
