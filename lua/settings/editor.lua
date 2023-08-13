local options = {
  listchars     = {
    -- tab      = "│·",
    tab         = "» ",
    trail       = "·",
    -- space       = "⋅",
    -- precedes = "←",
    extends     = "→",
    eol         = "↩",
    -- nbsp     = "␣",
  },

  fillchars     = {
    eob       = " ",
    diff      = "╱",
    fold      = " ",
    foldopen  = "",
    foldsep   = " ",
    foldclose = "»"
  },

  list          = true,

  winblend      = 10,

  termguicolors = true,
  -- undofile      = true,
  signcolumn    = "yes:2",
  encoding      = "UTF-8",
  background    = "dark",
  ignorecase    = true,
  smartcase     = true,
  cmdheight     = 1,
  tw            = 79,
  foldmethod    = "indent",
  foldlevel     = 99,
  foldcolumn    = "0",
  updatetime    = 2000,
  timeoutlen    = 500,
  hidden        = true,
  splitbelow    = true,
  splitright    = true,
  ts            = 2,
  sw            = 2,
  expandtab     = true,
  re            = 0,
  number        = true,
  wrap          = false,
  linebreak     = true,
  cursorline    = true,
  swapfile      = false,
  incsearch     = true,
  showmode      = false,
  laststatus    = 3,
  shortmess     = "IF",
  conceallevel  = 2,
  concealcursor = "n",

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
