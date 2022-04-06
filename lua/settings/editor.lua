local options = {
  listchars     = {
    -- tab      = "│·",
    tab         = "|·",
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

  list          = false,

  termguicolors = true,
  undofile      = true,
  signcolumn    = "yes",
  encoding      = "UTF-8",
  background    = "dark",
  ignorecase    = true,
  smartcase     = true,
  cmdheight     = 1,
  tw            = 79,
  foldmethod    = "indent",
  foldlevel     = 99,
  updatetime    = 1000,
  timeoutlen    = 500,
  hidden        = true,
  inccommand    = "split",
  splitbelow    = true,
  splitright    = true,
  ts            = 2,
  sw            = 2,
  expandtab     = true,
  re            = 0,
  number        = true,
  wrap          = false,
  cursorline    = true,
  swapfile      = false,
  incsearch     = true,

  shada         = {"!", "'1000", "<50", "s10", "h"},
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- the special case
vim.opt.formatoptions = vim.opt.formatoptions
- "a"
- "t"
+ "c"
+ "q"
- "o"
+ "r"
+ "n"
+ "j"
- "2"
