return {
  name = "buffers",

  n     = {"<cmd>bnext<cr>",                                   "next"},
  p     = {"<cmd>bprevious<cr>",                               "previous"},
  d     = {"<cmd>Bdelete<cr>",                                 "delete"},
  ["/"] = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "search"},
  i     = {"<cmd>Telescope buffers<cr>",                       "iBuffers"},
  j     = {"<cmd>BufferLinePick<cr>",                          "jump"},
  s     = {"<cmd>BufferLineSortByRelativeDirectory<cr>",       "sort"},
}
