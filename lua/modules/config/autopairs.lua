local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
  disable_filetype = { "TelescopePrompt" },
})

npairs.add_rules({
  Rule('"""$', '"""', "lua"):use_regex(true),
})

npairs.add_rules({
  Rule("then", "end"):end_wise(function(opts)
    -- Add any context checks here, e.g. line starts with "if"
    return string.match(opts.line, "^%s*if") ~= nil
  end),
})
