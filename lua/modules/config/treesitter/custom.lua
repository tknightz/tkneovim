-- Python for injecting rst
require("vim.treesitter.query").set_query("python", "injections", [[
((call
function: (attribute
  object: (identifier) @_re)
  arguments: (argument_list (string) @regex))
  (#eq? @_re "re")
  (#lua-match? @regex "^r.*"))

  ; Module docstring
  ((module . (expression_statement (string) @rst))
  (#offset! @rst 0 3 0 -3))

  ; Class docstring
  ((class_definition
  body: (block . (expression_statement (string) @rst)))
  (#offset! @rst 0 3 0 -3))
  
  ; Function/method docstring
  ((function_definition
  body: (block . (expression_statement (string) @rst)))
  (#offset! @rst 0 3 0 -3))

  ; Attribute docstring
  (((expression_statement (assignment)) . (expression_statement (string) @rst))
  (#offset! @rst 0 3 0 -3))

  (comment) @comment
  ]])


-- Javascript highlight undefined
-- require("vim.treesitter.query").set_query("javascript", "highlights", "(undefined) @constant.builtin")
