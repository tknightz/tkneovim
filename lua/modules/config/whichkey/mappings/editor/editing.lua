function copyFilePath()
  local path = vim.fn.expand("%:p");
  vim.api.nvim_command("let @+='" .. path .. "'")
end

return {
  name = "editing",

  a = {":EasyAlign<cr>",     "align"},
  c = {copyFilePath,         "copy file path"},
  y = {"\"+y",               "yanks"},
  Y = {"%y+<cr>",            "whole yanks"},
  s = {":set spell!<cr>",    "toggle spell"},
  h = {":set hlsearch!<cr>", "toggle hlsearch"},
  m = {":set mouse=a<cr>",   "mouse on"},
  n = {":tabnext<cr>",       "next tab"},
  p = {":tabprevious<cr>",   "previous tab"},
  M = {":set mouse=<cr>",    "mouse off"},
  n = {":tabnext<cr>",       "next tab"},
  p = {":tabprevious<cr>",   "prev tab"},
}
