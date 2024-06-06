local ts_config = require("nvim-treesitter.configs")

ts_config.setup({
  ensure_installed = {
    "javascript",
    "html",
    "css",
    "bash",
    "lua",
    "json",
    "go",
    "python",
  },
  install = {
    prefer_git = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = { "sql" },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gs",
      node_incremental = "gn",
      scope_incremental = "gk",
      node_decremental = "gp",
    },
  },
  yati = {
    enable = true,
    suppress_conflict_warning = true,
    default_lazy = true,
    default_fallback = "auto",
  },
  indent = {
    enable = true,
    disable = { "python", "typescriptreact" },
  },
  matchup = {
    enable = true,
  },
  textobjects = {
    move = {
      enable = true,
      goto_previous_start = {
        ["[f"] = "@method.def",
        ["[p"] = "@parameter.def",
        ["[c"] = "@class.outer",
      },
      goto_next_start = {
        ["]f"] = "@method.def",
        ["]p"] = "@parameter.def",
        ["]c"] = "@class.outer",
      },
    },

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
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        ["ip"] = "@parameter.inner",
        ["ap"] = "@parameter.outer",
        ["i/"] = "@comment.inner",
        ["a/"] = "@comment.outer",
        ["i_"] = "@comment.inner",
        ["a_"] = "@comment.outer",

        -- Or you can define your own textobjects like this
      },
    },
  },
  autotag = {
    enable = true,
    -- enable_rename = true,
    -- enable_close = true,
  },
  playground = {
    enable = false,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
})
