local builtin = require("statuscol.builtin")
local C = require("statuscol.ffidef").C
local special_fts = require("lib.consts").special_fts

local function space_after_fold(args)
  local foldinfo = C.fold_info(args.wp, args.lnum)
  local is_folded = foldinfo.lines > 0

  return is_folded and "%#Folded# %=" or "%#Normal# %="
end

require("statuscol").setup({
  ft_ignore = special_fts,
  bt_ignore = { "nofile", "terminal" },
  relculright = true,
  segments = {
    { text = { builtin.foldfunc, space_after_fold }, hl = "FoldColumn", click = "v:lua.ScFa" },
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    {
      sign = {
        namespace = { "gitsigns", "diagnostic/signs" },
        name = { "todo*", "kulala*" },
        maxwidth = 1,
        auto = false,
      },
      click = "v:lua.ScSa",
    },
  },
})
