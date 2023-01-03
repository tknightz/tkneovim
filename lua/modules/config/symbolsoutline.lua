require("symbols-outline").setup({
  preview_bg_highlight = 'SymbolsOutlineBg',
  auto_preview = false,
  relative_width = false,
  highlight_hovered_item = true,
  window_bg_highlight = 'SymbolsOutlineBg',
  show_guides = true,
  width = 40,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  symbols = {
    File = {hl = "@text.uri" },
    Module = {hl = "@namespace" },
    Namespace = {hl = "@namespace" },
    Package = {hl = "@namespace" },
    Class = {hl = "@type" },
    Method = {hl = "@method" },
    Property = { hl = "@method" },
    Field = {hl = "@field" },
    Constructor = {hl = "@constructor" },
    Enum = {hl = "@type" },
    Interface = {hl = "@type" },
    Function = { icon = " ", hl = "@function" },
    Variable = {hl = "@constant" },
    Constant = {hl = "@constant" },
    String = { icon = "  ", hl = "@string" },
    Number = {hl = "@number" },
    Boolean = {hl = "@boolean" },
    Array = {hl = "@constant" },
    Object = {hl = "@type" },
    Key = {hl = "@type" },
    Null = {hl = "@type" },
    EnumMember = {hl = "@field" },
    Struct = {hl = "@type" },
    Event = {hl = "@type" },
    Operator = {hl = "@operator" },
    TypeParameter = {hl = "@parameter" },
  },
})