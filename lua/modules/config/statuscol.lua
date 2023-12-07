local builtin = require("statuscol.builtin")

require("statuscol").setup({
  ft_ignore = {
    "help",
    "vim",
    "alpha",
    "dashboard",
    "neo-tree",
    "Trouble",
    "lazy",
    "toggleterm",
    "Dashboard",
    "DiffviewFiles",
    "aerial",
    "",
  },
  relculright = true,
  segments = {
    { text = { " ", builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    {
      sign = {
        namespace = { "gitsigns" },
        name = { "todo*" },
        maxwidth = 1,
        auto = false,
      },
      condition = {
        function(args)
          return vim.bo[args.buf].filetype ~= "fugitive"
        end,
      },
      click = "v:lua.ScSa",
    },
    -- {
    --   sign = { name = { "todo*" }, maxwidth = 1, auto = true },
    -- },
    {
      sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
      condition = { builtin.not_empty },
      click = "v:lua.ScSa",
    },
    { text = { builtin.foldfunc }, hl = "FoldColumn", click = "v:lua.ScFa" },
    {
      text = {
        function(args)
          local string = args.cul and args.relnum == 0 and "%#CursorLineFold#" or "%#FoldColumn#"
          return string .. " "
        end,
      },
      hl = "CursorLineFold",
    },
  },
})