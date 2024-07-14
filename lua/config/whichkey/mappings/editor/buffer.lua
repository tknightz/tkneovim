local wk = require("which-key")

wk.add({
  { "<leader>b", group = "buffers" },
  { "<leader>bn", "<cmd>bnext<cr>", desc = "next" },
  { "<leader>bp", "<cmd>bprevious<cr>", desc = "previous" },
  { "<leader>bd", "<cmd>Bdelete<cr>", desc = "delete" },
  { "<leader>bi", "<cmd>Telescope buffers<cr>", desc = "iBuffers" },
  { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "jump" },
  { "<leader>bs", "<cmd>BufferLineSortByRelativeDirectory<cr>", desc = "sort" },
  { "<leader>bX", "<cmd>BufferLineCloseOthers<cr>", desc = "close otherse" },
  { "<leader>bc", "<cmd>Cppath<cr>", desc = "copy file path" },
  { "<leader>b/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "search" },
})
