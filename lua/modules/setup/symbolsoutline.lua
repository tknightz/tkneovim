vim.cmd("hi SymbolsOutlineBg guibg=none")

vim.g.symbols_outline = {
  preview_bg_highlight = 'SymbolsOutlineBg',
  auto_preview = false,
  relative_width = false,
  width = 35,
  symbols = {
    Function = {icon = " ", hl = "TSFunction"}
  }
}
