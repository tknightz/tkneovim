local builtin = require("statuscol.builtin")
local special_fts = require("lib.consts").special_fts

require("statuscol").setup({
  ft_ignore = special_fts,
  relculright = true,
  segments = {
    { text = { builtin.foldfunc, " " }, hl = "FoldColumn", click = "v:lua.ScFa" },
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    {
      sign = {
        namespace = { "gitsigns" },
        name = { "todo*" },
        maxwidth = 1,
        auto = false,
      },
      click = "v:lua.ScSa",
    },
    {
      sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
      click = "v:lua.ScSa",
    },
  },
})
