local options = {
  listchars     = {
    -- tab      = "│·",
    tab         = "|-",
    trail       = "·",
    -- space    = "·",
    -- precedes = "←",
    extends     = "→",
    eol         = "↩",
    -- nbsp     = "␣"
  },

  fillchars     = {
    eob  = " ",
    diff = "╱"
  },
  list          = true,

  termguicolors = true,
  undofile      = true,
  signcolumn    = "yes",
  encoding      = "UTF-8",
  background    = "dark",
  ignorecase    = true,
  cmdheight     = 1,
  tw            = 79,
  foldmethod    = "indent",
  foldlevel     = 99,
  updatetime    = 100,
  timeoutlen    = 500,
  hidden        = true,
  inccommand    = "nosplit",
  splitbelow    = true,
  splitright    = true,
  ts            = 2,
  sw            = 2,
  expandtab     = true,
  re            = 0,
  number        = true,
  wrap          = false,
  cursorline    = true,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
