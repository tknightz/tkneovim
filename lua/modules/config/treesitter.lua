local ts_config = require("nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.markdown = {
  install_info = {
    url = "https://github.com/MDeiml/tree-sitter-markdown",
    branch = "main",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "markdown",
}

ts_config.setup {
  ensure_installed = {
    "javascript",
    "html",
    "css",
    "bash",
    "lua",
    "json",
    "go",
    "python"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = {"javascript", "javascriptreact","python", "ts", "tsx", "markdown", "org", "sql"}
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gs",
      node_incremental = "gn",
      scope_incremental = "gk",
      node_decremental = "gp",
    }
  },
  indent = {
    enable = false
  },
  matchup = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",


        -- Or you can define your own textobjects like this
      },
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  rainbow = {
    enable = true,
    disable = {"python", "html"},
    extended_mode = true,
    max_file_lines = nil,
  }
}
