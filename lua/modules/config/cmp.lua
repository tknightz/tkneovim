-- set vim completeopt
vim.o.completeopt = "menu,menuone,noselect"

local cmp = require("cmp")
local icons = require("modules.config.lspconfig.icons").icons

-- setting up autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- I use luasnip, so let's source it to cmp.
local luasnip = require("luasnip")

-- Set min_width for completion window
local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 30
local MIN_LABEL_WIDTH = 20

local has_words_before = function()
  ---@diagnostic disable-next-line: deprecated
  local unpack = table.unpack or unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Window customization
local cmp_win_options = {
  scrollbar = "│",
  winhighlight = "Normal:CmpWin,CursorLine:PmenuSel",
}

-- Set it up
cmp.setup({
  enabled = function()
    return vim.bo.filetype ~= "TelescopePrompt"
  end,
  debug = false,
  min_length = 3,
  preselect = cmp.PreselectMode.None,
  performance = {
    -- throttle_time = 500,
    -- source_timeout = 200,
    -- incomplete_delay = 300,
    -- max_view_entries = 12,
  },
  max_abbr_width = 150,
  max_kind_width = 100,
  -- max_menu_width = 100,
  min_menu_width = 180,
  window = {
    -- documentation = cmp.config.window.bordered(cmp_win_options),
    -- completion = cmp.config.window.bordered(cmp_win_options),
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-Space>"] = cmp.mapping(function(fallback)
      if has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {"i"}),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      -- elseif has_words_before() then
      --     cmp.complete()
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "")
        -- fallback()
      end
    end, { "i", "s" }),
    ["<C-k>"] = cmp.mapping(function(fallback)
      luasnip.expand()
    end, { "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "")
        -- fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({
      select = false,
    }),
  }),

  snippet = {
    -- We recommend using *actual* snippet engine.
    -- It's a simple implementation so it might not work in some of the cases.
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = "codeium" },
    { name = "cody" },
    { name = "luasnip" },
    { name = "nvim_lsp", max_item_count = 100 },
    { name = "nvim_lsp_signature_help" },
    -- { name = "vim-dadbod-completion" },
    { name = "path" },
    { name = "emoji" },
    { name = "nvim_lua" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  }),

  formatting = {
    fields = { "kind", "abbr", "menu" },

    format = function(entry, vim_item)
      local icon = vim_item.menu and icons[vim_item.menu] or icons[vim_item.kind]

      local label = vim_item.abbr
      local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
      if truncated_label ~= label then
        vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
      elseif string.len(label) < MIN_LABEL_WIDTH then
        local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
        vim_item.abbr = label .. padding
      end

      vim_item.menu = vim_item.menu and vim_item.menu or vim_item.kind
      vim_item.kind = (icon ~= nil and icon or "icon")
      vim_item.dup = ({
        nvim_lsp = 0,
        path = 0,
        buffer = 0,
      })[entry.source.name] or 0

      return vim_item
    end,
  },

  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      -- copied from TJ config
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find("^_+")
        local _, entry2_under = entry2.completion_item.label:find("^_+")
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  experimental = {
    -- native_menu = true,
    -- ghost_text = { hl_group = "Nontext" },
  },

  view = {
    entries = {
      follow_cursor = true
    }
    -- entries = "custom",
  },

  -- cmdline = {
  --   [":"] = { sources = { name = "cmdline" } },
  --   ["/"] = { sources = { name = "buffer" } },
  -- },
})

cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
  },
  mapping = cmp.mapping.preset.cmdline({
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item()),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item()),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item()),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  }),
})

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
  mapping = cmp.mapping.preset.cmdline({
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item()),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item()),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item()),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  }),
})
