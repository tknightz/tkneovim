require("blink.cmp").setup({
  highlight = {
    -- sets the fallback highlight groups to nvim-cmp's highlight groups
    -- useful for when your theme doesn't support blink.cmp
    -- will be removed in a future release, assuming themes add support
    use_nvim_cmp_as_default = true,
  },
  -- keymap = "super-tab",
  keymap = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide" },

    ["<Tab>"] = {
      function(cmp)
        if cmp.is_in_snippet() then
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
  -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
  -- adjusts spacing to ensure icons are aligned
  nerd_font_variant = "normal",
  kind_icons = require("config.lsp.icons").icons,

  windows = {
    autocomplete = {
      -- selection = "auto_insert",
      border = "rounded",
      draw = {
        padding = { 1, 1 },
        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 0 } },
        components = {},
      },
      winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
    },
    documentation = {
      min_width = 10,
      max_width = 60,
      max_height = 20,
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
      auto_show = false,
      auto_show_delay_ms = 500,
      update_delay_ms = 50,
    },
    signature_help = {
      min_width = 1,
      max_width = 100,
      max_height = 10,
      border = "rounded",
      winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
    },
    ghost_text = {
      enabled = true,
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
  trigger = {
    signature_help = { enabled = true },
    completion = { show_in_snippet = false },
  },
})
