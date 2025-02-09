local options = {
  listchars = {
    -- tab            = "  ",
    lead           = " ",
    leadmultispace = "│ ",
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
    vert = "│",
    horiz = '─',
  },

  list           = true,

  winblend       = 0,
  pumblend       = 0,

  tabline        = '',
  termguicolors  = true,
  -- undofile    = true,
  signcolumn     = "auto:1-2",
  encoding       = "UTF-8",
  background     = "dark",
  ignorecase     = true,
  smartcase      = true,
  cmdheight      = 1,
  tw             = 79,
  foldlevelstart = 99,
  foldmethod     = 'expr',
  foldexpr       = 'v:lua.vim.treesitter.foldexpr()',
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
  numberwidth    = 2,
  wrap           = true,
  breakindent    = true,
  linebreak      = true,
  showbreak      = "",
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
  -- winbar         = "    ",
  spelloptions   = "camel",
  guicursor      = "n-v-c-sm:block,i-ci-ve:ver25-iCursor-blinkwait300-blinkon200-blinkoff150,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor",

  shada          = { "!", "'1000", "<50", "s10", "h" },
  -- indentkeys     = "0{,0},0),0],:,(,0#,!^F,o,O,e"
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- the special case
vim.opt.formatoptions = vim.opt.formatoptions - "a" - "t" + "c" + "q" - "o" + "r" + "n" + "j" - "2"
vim.opt.spelloptions = vim.opt.spelloptions - "noplainbuffer"
