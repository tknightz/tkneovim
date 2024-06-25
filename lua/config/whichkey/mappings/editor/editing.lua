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

local common = {
  a = { toggle_ai, "AI completion" },
  f = { ":Neotree reveal<cr>", "toggle file explorer" },
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
