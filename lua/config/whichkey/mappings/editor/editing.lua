local function toggle_mouse()
  if vim.o.mouse == "a" then
    vim.o.mouse = ""
  else
    vim.o.mouse = "a"
  end
end

local common = {
  -- a = { ":EasyAlign<cr>", "align" },
  f = { ":Neotree reveal<cr>", "filetree"},
  y = { '"+y', "yanks" },
  Y = { "%y+<cr>", "whole yanks" },
  s = { ":set spell!<cr>", "toggle spell" },
  h = { ":set hlsearch!<cr>", "toggle hlsearch" },
  m = { toggle_mouse, "mouse on" },
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
