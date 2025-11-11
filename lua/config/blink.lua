require("blink.cmp").setup({
  keymap = {
    preset = "super-tab",
    ["<C-space>"] = {
      function(cmp)
        cmp.show({ providers = { "lsp", "buffer" } })
      end,
      "show_documentation",
      "hide_documentation",
    },
    ["<C-e>"] = { "hide", "fallback" },
    ["<C-k>"] = {},

    ["<Tab>"] = {
      "select_and_accept",
      "snippet_forward",
      function() -- sidekick next edit suggestion
        return require("sidekick").nes_jump_or_apply()
      end,
      function() -- if you are using Neovim's native inline completions
        return vim.lsp.inline_completion.get()
      end,
      "fallback",
    },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    -- ["<CR>"] = { "accept", "fallback" },

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },

    ["<C-d>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  },

  cmdline = {
    enabled = true,
    keymap = {
      preset = "cmdline",
      ["<Tab>"] = {
        function(cmp)
          cmp.show()
        end,
        "select_and_accept",
      },
      ["<CR>"] = { "accept_and_enter", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
    },

    sources = function()
      local type = vim.fn.getcmdtype()
      -- Search forward and backward
      if type == "/" or type == "?" then
        return { "buffer" }
      end
      -- Commands
      if type == ":" or type == "@" then
        return { "cmdline" }
      end
      return {}
    end,
    completion = {
      trigger = {
        show_on_blocked_trigger_characters = {},
        show_on_x_blocked_trigger_characters = {},
      },
      list = {
        selection = {
          -- When `true`, will automatically select the first item in the completion list
          -- preselect = true,
          -- When `true`, inserts the completion item automatically when selecting it
          auto_insert = true,
        },
      },
      -- Whether to automatically show the window when new completion items are available
      -- Default is false for cmdline, true for cmdwin (command-line window)
      -- menu = {
      --   auto_show = true
      -- },
      -- Displays a preview of the selected item on the current line
      ghost_text = { enabled = true },
    },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    kind_icons = require("config.lsp.icons").icons,
    nerd_font_variant = "mono",
  },

  completion = {
    keyword = {
      range = "full",
    },
    menu = {
      border = "rounded",
      -- border = "none",
      winblend = 0,
      scrollbar = true,
      -- direction_priority = { "e", "w", "n", "s" },
      draw = {
        align_to = "label",
        treesitter = { "lsp" },
        padding = 1,
        gap = 2,
        columns = { { "label", "label_description", gap = 2 }, { "kind_icon", "kind", gap = 1 } },
        components = {
          kind = {
            ellipsis = false,
            width = { fill = true },
            text = function(ctx)
              return ctx.kind
            end,
          },
          kind_icon = {
            text = function(ctx)
              return ctx.kind_icon .. ctx.icon_gap
            end,
          },
        },
      },
      winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
    },
    documentation = {
      window = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },
      auto_show = true,
      auto_show_delay_ms = 500,
      update_delay_ms = 50,
    },
    trigger = {
      show_in_snippet = true,
      show_on_insert_on_trigger_character = false,
      show_on_blocked_trigger_characters = { ",", " ", "\n", "\t" },
    },
    accept = {
      dot_repeat = false,
      create_undo_point = true,
      auto_brackets = { enabled = true },
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
        -- auto_insert = function(ctx)
        --   return ctx.mode ~= "cmdline"
        -- end,
      },
    },
    -- ghost_text = {
    --   enabled = true,
    -- },
  },

  signature = {
    enabled = true,
    trigger = {
      show_on_insert_on_trigger_character = true,
    },
    window = {
      border = "rounded",
      winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
    },
  },

  sources = {
    default = { "snippets", "lsp", "path", "buffer" },
    per_filetype = {
      sql = { "snippets", "dadbod", "buffer" },
      mysql = { "dadbod" },
      postgresql = { "dadbod" },
    },

    providers = {
      lsp = {
        name = "lsp",
        -- enabled = true,
        async = true,
        module = "blink.cmp.sources.lsp",
        fallbacks = { "buffer" },
        min_keyword_length = 1,
        opts = { tailwind_color_icon = "󱓻 " },
      },
      snippets = {
        name = "Snippets",
        module = "blink.cmp.sources.snippets",
        min_keyword_length = 1,
        score_offset = 1,
        -- opts = {
        --   friendly_snippets = true,
        --   search_paths = { vim.fn.stdpath("config") .. "/snippets" },
        --   global_snippets = { "all" },
        --   extended_filetypes = {
        --     typescript = { "javascript" },
        --     typescriptreact = { "javascript" },
        --   },
        -- },
        should_show_items = function(ctx)
          return ctx.trigger.initial_kind ~= "trigger_character"
        end,
        -- should_show_items = function()
        --   local buf = vim.api.nvim_get_current_buf()
        --   local cursor = vim.api.nvim_win_get_cursor(0)
        --   local row, col = cursor[1] - 1, cursor[2]
        --
        --   -- Get the current line content
        --   local line = vim.api.nvim_buf_get_lines(buf, row, row + 1, true)[1]
        --   if not line then
        --     return false
        --   end -- If the line is nil, return false
        --
        --   -- Case 1: Cursor is at the beginning of the line
        --   if col == 0 then
        --     return true
        --   end
        --
        --   -- Extract the word under the cursor
        --   local start_col, end_col = col, col
        --   while start_col > 0 and line:sub(start_col, start_col):match("[%w_]") do
        --     start_col = start_col - 1
        --   end
        --
        --   local before_word = line:sub(1, start_col)
        --   if before_word:find("[^ \t]") then
        --     return false
        --   end
        --
        --   return true
        -- end,
      },
      dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    },
  },

  fuzzy = {
    frecency = {
      enabled = false,
    },
    sorts = { "exact", "score", "label" },
  },

  snippets = {
    preset = "luasnip",
  },
})
