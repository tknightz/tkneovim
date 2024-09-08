local options = {
  listchars = {
    -- tab            = "  ",
    lead           = " ",
    precedes       = "←",
    extends        = "→",
    eol            = "↩",
    nbsp           = "␣",
    tab         = "│ ",
  },

  fillchars = {
    eob       = " ",
    diff      = "╱",
    fold      = " ",
    foldopen  = "󰧖",
    foldsep   = "│",
    foldclose = "󰧚",
    vert = "┃",
  },

  list           = true,

  winblend       = 5,
  pumblend       = 0,

  termguicolors  = true,
  -- undofile    = true,
  signcolumn     = "auto:1-2",
  encoding       = "UTF-8",
  background     = "dark",
  ignorecase     = true,
  smartcase      = true,
  cmdheight      = 1,
  tw             = 79,
  foldmethod     = "indent",
  foldlevel      = 99,
  foldcolumn     = "1",
  updatetime     = 100,
  timeoutlen     = 500,
  hidden         = true,
  splitkeep      = "screen",
  splitbelow     = true,
  splitright     = true,
  ts             = 2,
  sw             = 2,
  expandtab      = true,
  re             = 0,
  number         = true,
  relativenumber = true,
  wrap           = false,
  breakindent    = true,
  linebreak      = true,
  showbreak      = "   ",
  cursorline     = true,
  swapfile       = false,
  incsearch      = true,
  showmode       = false,
  laststatus     = 3,
  shortmess      = "IF",
  conceallevel   = 0,
  concealcursor  = "n",
  mouse          = "",
  mousemodel     = "extend",
  scrolloff      = 6,
  sidescrolloff  = 6,
  winbar         = "    ",

  shada          = { "!", "'1000", "<50", "s10", "h" },
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- the special case
vim.opt.formatoptions = vim.opt.formatoptions - "a" - "t" + "c" + "q" - "o" + "r" + "n" + "j" - "2"
