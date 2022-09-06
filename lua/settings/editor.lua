local home_path = vim.fn.expand('~')

local options = {
  listchars     = {
    -- tab      = "│·",
    tab         = "→ ",
    trail       = "·",
    space       = "⋅",
    -- precedes = "←",
    extends     = "→",
    eol         = "↩",
    -- nbsp     = "␣",
  },

  fillchars     = {
    eob       = " ",
    diff      = "╱",
    foldopen  = "",
    foldsep   = "│",
    foldclose = "»"
  },

  list          = true,

  exrc          = true,
  secure        = true,
  termguicolors = true,
  undofile      = true,
  undodir       = home_path .. "/.vim/undo",
  signcolumn    = "yes",
  encoding      = "UTF-8",
  background    = "dark",
  ignorecase    = true,
  smartcase     = true,
  cmdheight     = 1,
  tw            = 79,
  foldmethod    = "indent",
  foldlevel     = 99,
  updatetime    = 300,
  timeoutlen    = 500,
  hidden        = true,
  splitbelow    = true,
  splitright    = true,
  ts            = 4,
  sw            = 4,
  expandtab     = true,
  re            = 0,
  number        = true,
  wrap          = false,
  linebreak     = true,
  cursorline    = true,
  swapfile      = false,
  incsearch     = true,
  laststatus    = 3,

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
