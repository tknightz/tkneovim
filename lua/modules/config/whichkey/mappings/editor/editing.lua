local common = {
  a = { ":EasyAlign<cr>", "align" },
  y = { '"+y', "yanks" },
  Y = { "%y+<cr>", "whole yanks" },
  s = { ":set spell!<cr>", "toggle spell" },
  h = { ":set hlsearch!<cr>", "toggle hlsearch" },
  m = { ":set mouse=a<cr>", "mouse on" },
  M = { ":set mouse=<cr>", "mouse off" },
  n = { ":tabnext<cr>", "next tab" },
  N = { ":tabnew<cr>", "new tab" },
  x = { ":tabclose<cr>", "close tab" },
  p = { ":tabprevious<cr>", "prev tab" },
}

return {
  name = "editing",
  normal = common,
  visual = common,
}
