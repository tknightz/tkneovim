return {
  name = "terminal",

  k = { "<cmd>Ezterm top<cr>",                             "top" },
  j = { "<cmd>Ezterm bottom<cr>",                          "bottom" },
  l = { "<cmd>Ezterm right<cr>",                           "right" },
  h = { "<cmd>Ezterm left<cr>",                            "left" },
  c = { "<cmd>Ezterm<cr>",                                 "center" },
  i = { "<cmd>lua require('ezterm').ezterm_command()<cr>", "i-term" },
}
