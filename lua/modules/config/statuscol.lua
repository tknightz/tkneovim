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
    -- "fugitive",
    "DiffviewFiles",
  },
  relculright = true,
  segments = {
    {
      sign = {
        namespace = { "gitsigns" },
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
    {
      sign = { name = { "todo*" }, maxwidth = 1, auto = true },
    },
    {
      sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
      condition = { builtin.not_empty },
      click = "v:lua.ScSa",
    },
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
  },
})
