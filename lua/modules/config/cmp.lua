vim.o.completeopt = "menu,menuone,noselect"
local cmp = require'cmp'
local icons = require("modules.config.lspconfig.icons")
local lib = require("lib")

lib.load_module("luasnip")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()


local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


cmp.setup({
  enabled = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
  },

  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['('] = cmp.mapping(function(fallback)
      cmp.mapping.complete()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("()<left>", true, false, true), "n", true)
    end, { 'i', 's' }),
  },

  snippet = {
    -- We recommend using *actual* snippet engine.
    -- It's a simple implementation so it might not work in some of the cases.
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = "luasnip"},
    { name = 'path' },
    { name = 'buffer' },
    { name = 'emoji' },
    { name = 'nvim_lua' },
  }),

  formatting = {
    format = function(entry, vim_item)
      local icon = icons.icons[vim_item.kind]

      vim_item.kind = (icon ~= nil and icon or "icon") .. vim_item.kind
      

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        emoji = "[Emoji]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
        spell = "[Spell]",
        treesitter = "[Treesitter]",
        nvim_lua = "[Neovim]",
        luasnip = "[Snip]",
      })[entry.source.name]

      vim_item.abbr = string.sub(vim_item.abbr, 1, 30)

      return vim_item
    end,
  },

  confirmation = {
    get_commit_characters = function(commit_characters)
      return vim.tbl_filter(function(char)
        return char ~= ','
      end, commit_characters)
    end
  },

  experimental = {
    ghost_text = false
  }
})

cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
