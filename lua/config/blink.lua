require("blink.cmp").setup({
  keymap = {
    preset = "super-tab",
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide" },

    ["<Tab>"] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      "snippet_forward",
      "fallback",
    },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    ["<CR>"] = { "fallback" },

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    kind_icons = require("config.lsp.icons").icons,
    nerd_font_variant = "mono",
  },

  completion = {
    menu = {
      border = "rounded",
      winblend = 0,
      scrollbar = true,
      draw = {
        padding = 1,
        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 0 } },
      },
      winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
    },
    documentation = {
      window = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        -- which directions to show the documentation window,
        -- for each of the possible autocomplete window directions,
        -- falling back to the next direction when there's not enough space
        direction_priority = {
          autocomplete_north = { "e", "w", "n", "s" },
          autocomplete_south = { "e", "w", "s", "n" },
        },
        -- Controls whether the documentation window will automatically show when selecting a completion item
      },
      auto_show = true,
      auto_show_delay_ms = 500,
      update_delay_ms = 50,
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
    completion = {
      enabled_providers = { "lsp", "path", "snippets", "buffer" },
    },

    providers = {
      snippets = {
        name = "Snippets",
        module = "blink.cmp.sources.snippets",
        score_offset = 0,
        opts = {
          friendly_snippets = true,
          search_paths = { vim.fn.stdpath("config") .. "/snippets" },
          global_snippets = { "all" },
          extended_filetypes = {
            typescript = { "javascript" },
            typescriptreact = { "javascript" },
          },
        },
      },
    },
  },

  fuzzy = {
    use_frecency = false,
  },
  accept = { auto_brackets = { enabled = true } },
})
