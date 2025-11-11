local ts = require("nvim-treesitter")

-- vim.treesitter.language.register("markdown", { "mdx", "Avante" })
vim.treesitter.language.register("json", "kulala-json")
vim.treesitter.language.register("http", { "kulala_http", "http" })

ts.setup({
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
      init_selection = "gS",
      node_incremental = "gn",
      scope_incremental = "gk",
      node_decremental = "gp",
    },
  },
  -- yati = {
  --   enable = true,
  --   suppress_conflict_warning = true,
  --   default_lazy = true,
  --   default_fallback = function(lnum, computed, bufnr)
  --     if vim.tbl_contains(tm_fts, vim.bo[bufnr].filetype) then
  --       return require("tmindent").get_indent(lnum, bufnr) + computed
  --     end
  --     -- or any other fallback methods
  --     return require("nvim-yati.fallback").vim_auto(lnum, computed, bufnr)
  --   end,
  -- },
  indent = {
    enable = true,
    disable = { "gdscript" },
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

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   group = vim.api.nvim_create_augroup("lazy_treesitter", { clear = true }),
--   callback = function(event)
--     local bufnr = event.buf
--     local filetype, parser_name = event.match, vim.treesitter.language.get_lang(event.match)
--
--     -- Skip if no filetype
--     if filetype == "" then
--       return
--     end
--
--
--     -- Try to get existing parser (helpful check if filetype was returned above)
--     local parser_configs = require("nvim-treesitter.parsers")
--     if not parser_configs[parser_name] and parser_name ~= "kulala_http" then
--       return -- Parser not available, skip silently
--     end
--
--     local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)
--
--     if not parser_installed then
--       -- If not installed, install parser synchronously
--       require("nvim-treesitter").install({ parser_name }):wait(30000)
--     end
--
--     -- let's check again
--     -- parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)
--     -- print(parser_installed)
--
--     if parser_installed then
--       pcall(vim.treesitter.start)
--       -- vim.treesitter.start(bufnr, parser_name)
--     end
--   end,
-- })
